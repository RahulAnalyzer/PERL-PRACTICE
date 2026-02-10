use strict;
use warnings;
use DBI;

my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost";
my $user = "postgres";
my $pass = "rahul";

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 1,
    }
);
my $sql = q{
    SELECT emp_id , name , email , salary , dept , mob
    From employee
    Order by emp_id
};

my $sth = $dbh->prepare($sql);
$sth->execute;

while(my $row = $sth->fetchrow_hashref){
    print "ID : $row->{emp_id}\n";
    print "Name : $row->{name}\n";
    print "Email : $row->{email}\n";
    print "Salary : $row->{salary}\n";
    print "Department : $row->{dept}\n";
    print "Mobile : $row->{mob}\n";
}

$sth->finish;
$dbh->disconnect;
