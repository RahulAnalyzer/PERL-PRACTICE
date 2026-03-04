use strict;
use warnings;
use DBI;

# -----------------------------
# DATABASE CONNECTION
# -----------------------------
my $dsn  = "dbi:Pg:dbname=assignment;host=localhost;port=5432";
my $user = "postgres";
my $pass = "rahul";

my $dbh = DBI->connect(
    $dsn, $user, $pass,
    {
        RaiseError => 1,
        AutoCommit => 1,
        PrintError => 0,
    }
) or die "Connection failed: $DBI::errstr\n";

print "Connected successfully.\n";

# -----------------------------
# REUSABLE REPORT FUNCTION
# -----------------------------
sub print_report {
    my ($title, $sth) = @_;

    print "\n==============================\n";
    print "$title\n";
    print "==============================\n";

    my @cols = @{$sth->{NAME}};
    printf "%-20s" x scalar(@cols), @cols;
    print "\n";
    print "-" x (20 * scalar(@cols));
    print "\n";

    while (my @row = $sth->fetchrow_array) {
        printf "%-20s" x scalar(@row), @row;
        print "\n";
    }

    print "\n";
}

# -------------------------------------------------
# 1️⃣ INNER JOIN
# Engineers with allocated devices
# -------------------------------------------------
my $sql_inner = q{
    SELECT e.engineer_id,
           e.first_name || ' ' || e.last_name AS engineer_name,
           d.device_name,
           a.allocation_date
    FROM engineers e
    INNER JOIN allocations a ON e.engineer_id = a.engineer_id
    INNER JOIN devices d ON a.device_id = d.device_id
    ORDER BY e.engineer_id
};

my $sth_inner = $dbh->prepare($sql_inner);
$sth_inner->execute();
print_report("INNER JOIN - Engineers with Devices", $sth_inner);

# -------------------------------------------------
# 2️⃣ LEFT JOIN
# All engineers (even without devices)
# -------------------------------------------------
my $sql_left = q{
    SELECT e.engineer_id,
           e.first_name || ' ' || e.last_name AS engineer_name,
           d.device_name
    FROM engineers e
    LEFT JOIN allocations a ON e.engineer_id = a.engineer_id
    LEFT JOIN devices d ON a.device_id = d.device_id
    ORDER BY e.engineer_id
};

my $sth_left = $dbh->prepare($sql_left);
$sth_left->execute();
print_report("LEFT JOIN - All Engineers", $sth_left);

# -------------------------------------------------
# 3️⃣ RIGHT JOIN
# All devices (even if not allocated)
# -------------------------------------------------
my $sql_right = q{
    SELECT d.device_id,
           d.device_name,
           e.first_name || ' ' || e.last_name AS engineer_name
    FROM engineers e
    RIGHT JOIN allocations a ON e.engineer_id = a.engineer_id
    RIGHT JOIN devices d ON a.device_id = d.device_id
    ORDER BY d.device_id
};

my $sth_right = $dbh->prepare($sql_right);
$sth_right->execute();
print_report("RIGHT JOIN - All Devices", $sth_right);

# -------------------------------------------------
# 4️⃣ SELF JOIN
# Engineers hired on same date
# -------------------------------------------------
my $sql_self = q{
    SELECT e1.engineer_id AS engineer1,
           e2.engineer_id AS engineer2,
           e1.hire_date
    FROM engineers e1
    JOIN engineers e2
      ON e1.hire_date = e2.hire_date
     AND e1.engineer_id <> e2.engineer_id
    ORDER BY e1.hire_date
};

my $sth_self = $dbh->prepare($sql_self);
$sth_self->execute();
print_report("SELF JOIN - Same Hire Date", $sth_self);

# -------------------------------------------------
# 5️⃣ SUBQUERY
# Engineers working at more than 2 sites
# -------------------------------------------------
my $sql_sub1 = q{
    SELECT e.engineer_id,
           e.first_name,
           e.last_name
    FROM engineers e
    WHERE e.engineer_id IN (
        SELECT a.engineer_id
        FROM allocations a
        JOIN devices d ON a.device_id = d.device_id
        GROUP BY a.engineer_id
        HAVING COUNT(DISTINCT d.site_id) > 2
    )
};

my $sth_sub1 = $dbh->prepare($sql_sub1);
$sth_sub1->execute();
print_report("SUBQUERY - Engineers at > 2 Sites", $sth_sub1);

# -------------------------------------------------
# 6️⃣ SUBQUERY
# Devices not allocated
# -------------------------------------------------
my $sql_sub2 = q{
    SELECT d.device_id, d.device_name
    FROM devices d
    LEFT JOIN allocations a ON d.device_id = a.device_id
    WHERE a.device_id IS NULL
};

my $sth_sub2 = $dbh->prepare($sql_sub2);
$sth_sub2->execute();
print_report("SUBQUERY - Devices Not Allocated", $sth_sub2);

$dbh->disconnect;
print "Disconnected.\n";