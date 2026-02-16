use strict;
use warnings;
use MongoDB;
use Data::Dumper;

my $client = MongoDB->connect("mongodb://localhost:27017");
my $db = $client->get_database('Perl_nosql');
my $collection = $db->get_collection('user');

# Find one document
my $doc = $collection->find_one({firstName => "Rahul"});
print Dumper($doc);