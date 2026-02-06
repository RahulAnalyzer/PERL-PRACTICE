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


    my $sth = $dbh->prepare(
        'INSERT INTO department (dep_name) VALUES (?)'
    );

    $sth->execute('Enginner');
    $sth->execute('HR');
    $sth->execute('data analyst');

    $dbh->commit;

print "department inserted\n";
$sth->finish;
$dbh->disconnect;
