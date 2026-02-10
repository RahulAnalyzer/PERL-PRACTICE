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
        AutoCommit => 0, # IMPORTANT
    }
);

eval {
    my $sth = $dbh->prepare(
        'INSERT INTO EMPLOYEE (name , email , salary) VALUES (?, ?, ?)'
    );

    $sth->execute('John' , 'john\@gmail.com' , 50000);

    #force an Error (duplicate email)
    $sth->execute('jane' , 'john\@gmail.com' , 60000);

    $dbh->commit; # reached only if both succeed
};

if ($@) 
{
    warn "Transcation Failed , rolling Back: $@";
}

$dbh->disconnect;