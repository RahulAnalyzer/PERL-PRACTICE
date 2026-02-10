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
    AutoCommit => 1,
    }
);

my $sql = q{
    INSERT INTO Employee (name , email , salary , departments)
    Values (?, ?, ?, ?)
};

my $sth = $dbh->prepare($sql);

while(1){
    print "\nEnter Name (or type exit): ";
    chomp(my $name = <STDIN>);
    last if $name eq "exit";

    print "Enter Email: ";
    chomp(my $email = <STDIN>);

    print "Enter Salary: ";
    chomp(my $salary = <STDIN>);

    print "Enter Department: ";
    chomp(my $department = <STDIN>);

    $sth->execute($name , $email, $salary , $department);

    print "Inserted Successfully!\n";
}
# $sth->execute("Rahul" , "rahul\@example.com" , 55000);
# $sth->execute("Amit" , "Amit\@example.com" , 62000);

# print "Date inserted successfully\n";

$sth->finish;
$dbh->disconnect;

print "\nAll Records Inserted.\n";