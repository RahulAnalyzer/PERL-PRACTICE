use strict;
use warnings;
use DBI;
use JSON;
use LWP::UserAgent;

# DBI Config

my $dsn = "DBI:Pg:Dbname=perl_dbi;host=localhost;port=5432";
my $user = "postgres";
my $pass = 'rahul';

#read json data
open my $fh , '<' , 'employee.json'
    or die "cannot open this file:$!";

my $json_text = do{
    local $/;
    <$fh>
}
close $fh;

my $employee = decode_json($json_text);
die "JSON must be array" unless ref $employee eq 'ARRAY';

# connect the DB
my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 0,
    }
);

my $sth = $dbh->prepare(q{
    INSERT INTO EMPLOYEE(name , email , salary , dept , mob)
    VALUES (?,?,?,?,?)
});

eval{
    for my $emp(@$employee){
        #validation 

        die "Missing name" unless defined $emp->{name};
        die "Missing Email" unless defined $emp->{email};
        die "Missing Salary" unless defined $emp->{salary};
        die "Missing dept" unless defined $emp->{dept};
        die "Missing mobile" unless defined $emp->{mob};

        $sth->execute(
            $emp->{name},
            $emp->{email},
            $emp->{salary},
            $emp->{dept},
            $emp->{mob}
        );
    }
    $dbh->commit; # ALL ROWS succeeded
};

if($@){
    warn "ERRO occurred: $@";
    $dbh->rollback;
    print "TRANSACTION ROLLED BACK. NO DATA INSERTED.\n";
}else{
    print "ALL EMPLOYEES INSERTED SUCCESSFULLY.\n";
}

$sth->finish;
$dbh->disconnect;