use strict;
use warnings;
use DBI;
use POSIX qw(strftime);

# ==========================
# DATABASE CONNECTION
# ==========================

my $dsn  = "dbi:Pg:dbname=engineering_db;host=localhost";
my $user = "postgres";
my $pass = "postgres";

my $dbh = DBI->connect($dsn, $user, $pass, {
    AutoCommit => 1,
    RaiseError => 1,
    PrintError => 0
}) or die "Connection failed: $DBI::errstr";

print "\nConnected to PostgreSQL successfully.\n";

# ==========================
# ASSIGNMENT 1 – SCHEMA
# ==========================

sub create_schema {

    $dbh->do("DROP TABLE IF EXISTS allocations CASCADE");
    $dbh->do("DROP TABLE IF EXISTS device_audit_log CASCADE");
    $dbh->do("DROP TABLE IF EXISTS engineers CASCADE");
    $dbh->do("DROP TABLE IF EXISTS devices CASCADE");
    $dbh->do("DROP TABLE IF EXISTS sites CASCADE");

    $dbh->do("
        CREATE TABLE engineers (
            engineer_id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            email VARCHAR(150) UNIQUE NOT NULL,
            experience INT CHECK (experience >= 0)
        )
    ");

    $dbh->do("
        CREATE TABLE sites (
            site_id SERIAL PRIMARY KEY,
            site_name VARCHAR(100) NOT NULL,
            location VARCHAR(100) NOT NULL
        )
    ");

    $dbh->do("
        CREATE TABLE devices (
            device_id SERIAL PRIMARY KEY,
            device_name VARCHAR(100) NOT NULL,
            purchase_date DATE NOT NULL,
            status VARCHAR(10)
            CHECK (status IN ('ACTIVE','FAULTY','RETIRED'))
            NOT NULL
        )
    ");

    $dbh->do("
        CREATE TABLE allocations (
            engineer_id INT,
            device_id INT,
            site_id INT,
            allocation_date DATE DEFAULT CURRENT_DATE,
            PRIMARY KEY (engineer_id, device_id, site_id),
            FOREIGN KEY (engineer_id) REFERENCES engineers(engineer_id) ON DELETE CASCADE,
            FOREIGN KEY (device_id) REFERENCES devices(device_id) ON DELETE CASCADE,
            FOREIGN KEY (site_id) REFERENCES sites(site_id) ON DELETE CASCADE
        )
    ");

    print "Schema created successfully.\n";
}

# ==========================
# ASSIGNMENT 2 – INSERT DATA
# ==========================

sub insert_sample_data {

    my $eng_sth = $dbh->prepare("INSERT INTO engineers(name,email,experience) VALUES (?,?,?)");
    for my $i (1..20) {
        $eng_sth->execute("Engineer$i","eng$i\@mail.com", int(rand(10)));
    }

    my $site_sth = $dbh->prepare("INSERT INTO sites(site_name,location) VALUES (?,?)");
    for my $i (1..20) {
        $site_sth->execute("Site$i","City$i");
    }

    my $dev_sth = $dbh->prepare("INSERT INTO devices(device_name,purchase_date,status) VALUES (?,?,?)");
    my @status = ('ACTIVE','FAULTY','RETIRED');

    for my $i (1..20) {
        $dev_sth->execute("Device$i","2018-01-01",$status[rand @status]);
    }

    print "Sample data inserted.\n";
}

# ==========================
# JOINS & REPORT
# ==========================

sub show_allocations {

    my $sth = $dbh->prepare("
        SELECT e.name, d.device_name, s.site_name
        FROM allocations a
        INNER JOIN engineers e ON a.engineer_id = e.engineer_id
        INNER JOIN devices d ON a.device_id = d.device_id
        INNER JOIN sites s ON a.site_id = s.site_id
    ");

    $sth->execute();

    print "\n--- Allocation Report ---\n";
    while (my @row = $sth->fetchrow_array) {
        printf "%-15s %-15s %-15s\n", @row;
    }
}

# ==========================
# ASSIGNMENT 3 – VIEW
# ==========================

sub create_view {

    $dbh->do("
        CREATE OR REPLACE VIEW active_engineer_allocations AS
        SELECT e.name, d.device_name, s.site_name
        FROM allocations a
        JOIN engineers e ON a.engineer_id = e.engineer_id
        JOIN devices d ON a.device_id = d.device_id
        JOIN sites s ON a.site_id = s.site_id
        WHERE d.status = 'ACTIVE'
    ");

    print "View created.\n";
}

# ==========================
# FUNCTION
# ==========================

sub create_function {

    $dbh->do("
        CREATE OR REPLACE FUNCTION count_devices(p_site_id INT)
        RETURNS INT AS $$
        DECLARE total INT;
        BEGIN
            SELECT COUNT(*) INTO total
            FROM allocations
            WHERE site_id = p_site_id;
            RETURN total;
        END;
        $$ LANGUAGE plpgsql;
    ");

    print "Function created.\n";
}

# ==========================
# STORED PROCEDURE
# ==========================

sub create_procedure {

    $dbh->do("
        CREATE OR REPLACE PROCEDURE allocate_device(
            IN p_engineer INT,
            IN p_device INT,
            IN p_site INT,
            OUT message TEXT
        )
        LANGUAGE plpgsql
        AS $$
        BEGIN
            IF (SELECT status FROM devices WHERE device_id=p_device) <> 'ACTIVE' THEN
                message := 'Device not active';
            ELSE
                INSERT INTO allocations(engineer_id,device_id,site_id)
                VALUES (p_engineer,p_device,p_site);
                message := 'Allocation successful';
            END IF;
        END;
        $$;
    ");

    print "Procedure created.\n";
}

# ==========================
# TRIGGER
# ==========================

sub create_trigger {

    $dbh->do("
        CREATE TABLE IF NOT EXISTS device_audit_log (
            log_id SERIAL PRIMARY KEY,
            device_id INT,
            old_status VARCHAR(10),
            new_status VARCHAR(10),
            changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ");

    $dbh->do("
        CREATE OR REPLACE FUNCTION log_device_update()
        RETURNS TRIGGER AS $$
        BEGIN
            INSERT INTO device_audit_log(device_id,old_status,new_status)
            VALUES (OLD.device_id,OLD.status,NEW.status);
            RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;
    ");

    $dbh->do("
        DROP TRIGGER IF EXISTS before_device_update ON devices;
    ");

    $dbh->do("
        CREATE TRIGGER before_device_update
        BEFORE UPDATE ON devices
        FOR EACH ROW
        EXECUTE FUNCTION log_device_update();
    ");

    print "Trigger created.\n";
}

# ==========================
# CLI TOOL WITH TRANSACTION
# ==========================

sub cli {

    while (1) {

        print "\n1. Allocate Device\n";
        print "2. View Allocations\n";
        print "3. Retire Device\n";
        print "4. Exit\n";
        print "Choice: ";

        chomp(my $choice = <STDIN>);

        if ($choice == 1) {

            print "Engineer ID: "; chomp(my $e=<STDIN>);
            print "Device ID: ";   chomp(my $d=<STDIN>);
            print "Site ID: ";     chomp(my $s=<STDIN>);

            eval {
                $dbh->{AutoCommit} = 0;

                my $sth = $dbh->prepare("CALL allocate_device(?,?,?,?)");
                $sth->bind_param(1,$e);
                $sth->bind_param(2,$d);
                $sth->bind_param(3,$s);
                $sth->bind_param_inout(4,\my $msg,100);
                $sth->execute();

                print "Result: $msg\n";

                $dbh->commit;
            };

            if ($@) {
                print "Error occurred. Rolling back.\n";
                $dbh->rollback;
            }

            $dbh->{AutoCommit} = 1;
        }

        elsif ($choice == 2) {
            show_allocations();
        }

        elsif ($choice == 3) {

            print "Device ID: ";
            chomp(my $id=<STDIN>);

            eval {
                $dbh->{AutoCommit} = 0;
                $dbh->do("UPDATE devices SET status='RETIRED' WHERE device_id=?",undef,$id);
                $dbh->commit;
                print "Device retired successfully.\n";
            };

            if ($@) {
                print "Error. Rollback executed.\n";
                $dbh->rollback;
            }

            $dbh->{AutoCommit} = 1;
        }

        elsif ($choice == 4) {
            last;
        }
    }
}

# ==========================
# RUN ALL SETUP
# ==========================

create_schema();
insert_sample_data();
create_view();
create_function();
create_procedure();
create_trigger();

cli();

$dbh->disconnect;
print "\nDisconnected.\n";