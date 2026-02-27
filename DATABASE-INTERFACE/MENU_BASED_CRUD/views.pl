use strict;
use warnings;
use DBI;

# ===============================
# DATABASE CONNECTION
# ===============================

my $dsn  = "dbi:Pg:dbname=engineering_db;host=localhost";
my $user = "postgres";
my $pass = "postgres";

my $dbh = DBI->connect($dsn, $user, $pass, {
    AutoCommit => 1,
    RaiseError => 1,
    PrintError => 0
}) or die "Connection failed: $DBI::errstr";

print "\nConnected to PostgreSQL successfully.\n";

# =====================================================
# 1. USING VIEW
# =====================================================

sub show_active_allocations {

    print "\n=== ACTIVE ENGINEER ALLOCATIONS (VIEW) ===\n";

    my $sth = $dbh->prepare("
        SELECT name, device_name, site_name
        FROM active_engineer_allocations
    ");

    $sth->execute();

    while (my @row = $sth->fetchrow_array) {
        printf "%-15s %-15s %-15s\n", @row;
    }

    $sth->finish();
}

# =====================================================
# 2. USING FUNCTION (Count Devices per Site)
# =====================================================

sub count_devices_per_site {

    print "\nEnter Site ID to count devices: ";
    chomp(my $site_id = <STDIN>);

    my $sth = $dbh->prepare("SELECT count_devices(?)");

    $sth->execute($site_id);

    my ($count) = $sth->fetchrow_array;

    print "Total devices allocated at site $site_id: $count\n";

    $sth->finish();
}

# =====================================================
# 3. USING STORED PROCEDURE (Allocate Device)
# =====================================================

sub allocate_device_procedure {

    print "\nEngineer ID: ";
    chomp(my $eng = <STDIN>);

    print "Device ID: ";
    chomp(my $dev = <STDIN>);

    print "Site ID: ";
    chomp(my $site = <STDIN>);

    eval {

        $dbh->{AutoCommit} = 0;

        my $sth = $dbh->prepare("CALL allocate_device(?, ?, ?, ?)");

        my $message;

        $sth->bind_param(1, $eng);
        $sth->bind_param(2, $dev);
        $sth->bind_param(3, $site);
        $sth->bind_param_inout(4, \$message, 100);

        $sth->execute();

        print "Procedure Result: $message\n";

        $dbh->commit;
    };

    if ($@) {
        print "Error occurred. Rolling back transaction.\n";
        $dbh->rollback;
    }

    $dbh->{AutoCommit} = 1;
}

# =====================================================
# MENU SYSTEM
# =====================================================

sub menu {

    while (1) {

        print "\n========= MENU =========\n";
        print "1. View Active Allocations (VIEW)\n";
        print "2. Count Devices Per Site (FUNCTION)\n";
        print "3. Allocate Device (PROCEDURE)\n";
        print "4. Exit\n";
        print "Enter choice: ";

        chomp(my $choice = <STDIN>);

        if ($choice == 1) {
            show_active_allocations();
        }
        elsif ($choice == 2) {
            count_devices_per_site();
        }
        elsif ($choice == 3) {
            allocate_device_procedure();
        }
        elsif ($choice == 4) {
            last;
        }
        else {
            print "Invalid option.\n";
        }
    }
}

# =====================================================
# RUN
# =====================================================

menu();

$dbh->disconnect;
print "\nDisconnected successfully.\n";