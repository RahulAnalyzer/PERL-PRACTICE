use strict;
use warnings;
use MongoDB;

my $client = MongoDB->connect("mongodb://localhost:27017");
my $db = $client->get_database('perl_nosql');
my $collection = $db->get_collection('users');

my $result = $collection->delete_one(
    { firstName => "Rahul" }
);

print "Deleted: " . $result->deleted_count . "\n";