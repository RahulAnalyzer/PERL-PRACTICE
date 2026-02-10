# DBD::mySQL , DBD::SQlite , DBD::pg

# first we do with the SQLite
use DBI;
# my $dbname = "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/Data-Base-Interface/test.db";
# my $driver = "SQLite";
# my $dsn = "DBI:$driver:dbname=$dbname";

# my $username = "";
# my $password = "";

# my $dbh = DBI->connect($dsn , $username , $password , {RaiseError=>1,AutoCommit=>1}) or die "Cannot establish Connection: $DBI::errstr";

# print "Connected to the database Successfully";
# $dbh->disconnect();



#MySQl
# my $dns = "DBI:ODBC:Driver={MySQL ODBC 9.6 Unicode Driver};"
          

my $dbname = "mySql_test_db";
my $host = "localhost";
my $port = 3306;

my $username = "root";
my $password = "Rahul@819";

my $dsn = "DBI:mysql:database=$dbname;host=$host;port=$port";

my $dbh = DBI->connect($dsn , $username , $password , {
    AutoCommit => 1,
    RaiseError => 1,
}) or die "Cannot Connect: $DBI::errstr";

print "Connected to MySql successfully!\n";

$dbh->disconnect();