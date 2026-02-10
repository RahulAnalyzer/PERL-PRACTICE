use strict;
use warnings;
use DBI;

my $dbname = "postgres";
my $host = "localhost";
my $port = 5432;
my $user = "postgres";
my $pass = "rahul";


my $dsn = "dbi:Pg:dbname=$dbname;host=$host;port=$port";
my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,{
        RasieError => 1, AutoCommit => 1
    }
) or die $DBI::errstr;

print "Connected SuccessFully\n";


my $new_db = "New_database";
my $sql = "CREATE DATABASE $new_db";
$dbh->do($sql);
print "Database '$new_db' Created Successfully\n";
$dbh->disconnect;