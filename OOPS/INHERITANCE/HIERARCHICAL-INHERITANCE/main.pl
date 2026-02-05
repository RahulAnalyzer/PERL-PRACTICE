use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/INHERITANCE/HIERARCHICAL-INHERITANCE";

use Circle;
use Rectangle;

my $circle    = Circle->new(5);
my $rectangle = Rectangle->new(20, 20);

print "Radius: " . $circle->get_radius() . "\n";

my ($l, $w) = $rectangle->get_dimension();
print "Length: $l Width: $w\n";

print $circle->type() . "\n";
print $rectangle->type() . "\n";
