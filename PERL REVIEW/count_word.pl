# Perl program to create a dictionary (hash) counting letter occurrences in a string

use strict;
use warnings;

my $string = 'w3resource'; 
my %dict;                  


foreach my $char (split //, $string) {
   
    $dict{$char}++;
}


print "{";
my @pairs;
while (my ($key, $value) = each %dict) {
    push @pairs, "'$key': $value";
}
print join(", ", @pairs);
print "}\n";