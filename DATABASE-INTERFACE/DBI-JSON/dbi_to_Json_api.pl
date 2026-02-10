use strict;
use warnings;
use JSON;
use DBI;
use LWP::UserAgent;
use HTTP::Request;


# DBI CONFIG
my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
my $user = "postgres";
my $pass = 'rahul';

# API URL
my $url = "https://dummyjson.com/users";

my $ua = LWP::UserAgent->new(
    timeout => 10,
);
$ua->default_header(
    'User-Agent' => 'Mozilla/5.0',
    'Accept'     => 'application/json',
);

my $response = $ua->get($url);
# die "API REQUEST FAILED: " . $response->status_line
# unless $response->is_success;
unless ($response->is_success) {
    die "API REQUEST FAILED: "
        . $response->status_line . "\n"
        . $response->decoded_content;
}

my $data = decode_json($response->decoded_content);

# die "API DID NOT RETURN ARRAY"
# unless ref $data eq 'HASH' && ref $data eq 'ARRAY';
die "API DID NOT RETURN users array"
    unless ref $data eq 'HASH'
        && exists $data->{users}
        && ref $data->{users} eq 'ARRAY';



# DBI CONNECT
my $dbh = DBI->connect(
    $dsn, 
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 0,
    }
);
my $users = $data->{users};
my $sth = $dbh->prepare(q{

    INSERT INTO jsondetail (id , firstName , lastName , maidenName , age , gender , email, phone , username , password , birthDate , height , weight)
    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ON CONFLICT (id) DO NOTHING
});

eval{
    for my $u (@$users){
        #BASIC VALIDATION
        die "Missing id / firstName / lastName / maidenName / age / gender / email / phone /username / password / birthDate / height / weight"
            unless defined $u->{id}
            && defined $u->{firstName}
            && defined $u->{lastName}
            && defined $u->{maidenName}
            && defined $u->{age}
            && defined $u->{gender}
            && defined $u->{email}
            && defined $u->{phone}
            && defined $u->{username}
            && defined $u->{password}
            && defined $u->{birthDate}
            && defined $u->{height}
            && defined $u->{weight};

            $sth->execute(
                $u->{id},
                $u->{firstName},
                $u->{lastName},
                $u->{maidenName},
                $u->{age},
                $u->{gender},
                $u->{email},
                $u->{phone},
                $u->{username},
                $u->{password},
                $u->{birthDate},
                $u->{height},
                $u->{weight},
            );

    }
    $dbh->commit;
};
if($@){
    warn "ERROR OCCURED:$@";
    $dbh->rollback;
    print "Transaction rolled back.NO data is inserted.\n";

}else{
    print "API JSON DATA inserted successfully\n";
}
$sth->finish;
$dbh->disconnect;
