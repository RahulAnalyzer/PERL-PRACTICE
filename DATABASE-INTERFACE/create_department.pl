# we are going to do JOINs NOW 
use strict;
use warnings;
use DBI;

my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";

my $user = "postgres";
my $pass = "rahul";

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,{
        RaiseError => 1,
        AutoCommit => 1,
    }

);

# my $sql = qq{
#     CREATE TABLE IF NOT EXISTS Department(
#         dep_id SERIAL PRIMARY KEY,
#         dep_name TEXT NOT NULL
#     )
# };

$dbh->do(q{
    Create table if not exists department(
        dep_id SERIAL PRIMARY KEY,
        dep_name TEXT NOT NULL
    )
});
print "Department Table is Created Successfully\n";

$dbh->disconnect;