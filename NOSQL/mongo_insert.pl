use strict;
use warnings;
use MongoDB;
use Data::Dumper;

my $client = MongoDB->connect("mongodb://localhost:27017");
my $db = $client->get_database('Perl_nosql');

my $collection = $db->get_collection('user');

my $result = $collection->insert_one({
    firstName => "Rahul",
    lastName => "Singh",
    age => 21,
    email => "rahulsingh@/gmail.com",
    address =>{
        city => "chandigarh",
        country => "India"
    }
});

print "Inserted ID: ". $result->inserted_id . "\n";