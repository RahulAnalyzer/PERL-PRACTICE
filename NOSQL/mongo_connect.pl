use strict;
use warnings;
use MongoDB;

#create client (conncet to localhost:27017 by default)
my $client = MongoDB->connect("mongodb://localhost:27017");

#get database

my $db = $client->get_database('Perl_nosql');
print "connected to MongoDB successfully\n";