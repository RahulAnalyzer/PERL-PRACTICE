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
# my $sql = q{
#     DELETE FROM employee
#     WHERE email = ?
# };
eval{
  my $rows_deleted = $dbh->do("DELETE FROM employee");
  $dbh->commit();

  print "$rows_deleted records deleted from employee table\n"; 

};

if($@){
    warn "Error : $@";
    eval{$dbh->rollback()};
    print "Deletion rollback\n";
}













# my $sth = $dbh->prepare($sql);

# my $rows = $sth->execute('Amit@example.com');

# if ($rows == 0){
#     print "No rows Deleted\n";
# }else{
#     print "Deleted $rows row(s)\n";
# }

# $sth->finish;
$dbh->disconnect;