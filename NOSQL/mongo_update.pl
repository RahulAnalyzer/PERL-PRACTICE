use strict;
use warnings;
use MongoDB;


my $client = MongoDB->connect("mongodb://localhost:27017");
my $db = $client->get_database('Perl_nosql');
my $collection = $db->get_collection('user');

my $result = $collection->update_one(
    { firstName => "Rahul" },
    { '$set' => {age => 22}} 
);

print "Matched: " . $result->matched_count . "\n";
print "Modified: " . $result->modified_count . "\n";