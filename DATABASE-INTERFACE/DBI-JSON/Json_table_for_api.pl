use strict;
use warnings;
use DBI;

my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
my $user = "postgres";
my $pass = 'rahul';

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 0,
    }
);

$dbh->do(q{
    CREATE TABLE IF NOT EXISTS jsondetail(
        id INT PRIMARY KEY,
        firstName VARCHAR(50) NOT NULL,
        lastName VARCHAR(50) NOT NULL,
        maidenName VARCHAR(50),
        age INT NOT NULL,
        gender VARCHAR(10),
        email TEXT UNIQUE,
        phone TEXT,
        username VARCHAR(50),
        password VARCHAR(50),
        birthDate DATE,
        height NUMERIC(6,2),
        weight NUMERIC(6,2)
    )
});
$dbh->commit;

print "jsonDetail table is Created Successfully";
$dbh->disconnect;