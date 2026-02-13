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
        AutoCommit => 1,
    }
);

my $psql = q{

    SELECT id,firstName , lastName , age , gender
    FROM jsondetail
    WHERE gender = ?
    AND age > ?
    ORDER BY age DESC
};

my $sth = $dbh->prepare(q{
    SELECT id , firstName , lastName , height , gender
    FROM jsondetail 
    ORDER BY height DESC
    LIMIT 5
});
$sth->execute;

# my $sth = $dbh->prepare($psql);
# $sth->execute('male',30);


 print "\n======= TOP 5 TALLEST USER ========\n";
while(my $row = $sth->fetchrow_hashref){
   
    print "ID:  $row->{id}, ";
    print "First Name: $row->{firstname}, ";
    print "Last Name: $row->{lastname}, ";
    print "height: $row->{height}, ";
    print "Gender : $row->{gender}\n";
}

$sth->finish;
$dbh->disconnect;