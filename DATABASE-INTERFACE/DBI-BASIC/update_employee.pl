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

    }
);
# ADD THE department column in the Existing employee table

eval{

    $dbh->do(q{
        ALTER TABLE employee
        ADD COLUMN departments VARCHAR(50)
    });
    

    $dbh->commit();
    print "Department Columns Added Successfully\n";

};
if($@){
    warn "Error: $@";
    eval{$dbh->rollback()};
    print "Changes rolled back.\n";
}

$dbh->disconnect;
# my $sql = q{
#     UPDATE employee
#     SET salary = ?
#     WHERE email = ?
# };

# my $sth = $dbh->prepare($sql);

# my $rows = $sth->execute(55000, 'rahul@example.com');

# if($rows == 0){
#     print "NO Rows updated (email not found)\n";
# }else
# {
#     print "Update $rows row(s)\n";
# }

# $sth->finish;
# $dbh->disconnect;