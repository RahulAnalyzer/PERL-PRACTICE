use strict;
use warnings;
use JSON;
use MongoDB;
use HTTP::Tiny;

# ====== API =========

my $url = 'https://jsonplaceholder.typicode.com/users';
# (Switching API because dummyjson often blocks Perl clients)

my $http = HTTP::Tiny->new(
    agent => 'Mozilla/5.0'
);

my $response = $http->get($url);

die "API failed: $response->{status} $response->{reason}\n"
    unless $response->{success};

my $data = decode_json($response->{content});

die "Invalid Structure"
    unless ref $data eq 'ARRAY';
    

# ======= MONGO DB ============

my $client = MongoDB->connect("mongodb://localhost:27017");
my $db = $client->get_database('Perl_nosql');
my $collection = $db->get_collection('api_users');

# ====== INSERT ==========

for my $user (@$data) {

    # Use API id as _id to prevent duplicates
    $user->{_id} = delete $user->{id};

    $collection->replace_one(
        { _id => $user->{_id} },
        $user,
        { upsert => 1 }
    );
}

print "Inserted/Updated API data into MongoDB\n";
