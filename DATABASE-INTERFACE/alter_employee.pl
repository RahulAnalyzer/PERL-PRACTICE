use strict;
use warnings;
use DBI;

my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
my $user = "postgres";
my $pass = "rahul";

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 0,
        PrintError => 1,

    }
);
eval{

$dbh->do(q{

    ALTER TABLE employee
    ADD COLUMN dep_id INTEGER

});

$dbh->do(q{
    ALTER TABLE employee
    ADD CONSTRAINT fk_dept
    FOREIGN KEY (dep_id)
    REFERENCES department(dep_id)
});
$dbh->commit();
print "Employee Table altered successfully\n";
};

if ($@){
    warn "Transaction Failed: $@";
    eval {$dbh->rollback()};
    print "Changes Rolled back due to error\n";
}
$dbh->disconnect;
