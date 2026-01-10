use strict;
use warnings;

print "Enter a Region Name: ";
chomp(my $input =<STDIN>);

my @Region = split (/\s+/, $input);
my %seen;

foreach my $elem(@Region){
    $seen{$elem} = 1;
}

my @unique = sort keys %seen;
print "Unique Region @unique\n";
