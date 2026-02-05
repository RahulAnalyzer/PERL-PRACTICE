use strict;
use warnings;

BEGIN{
    push @INC, 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\HIERARCHICAL-INHERITANCE';
};

use Shape;
use Circle;
use Rectangle;
my $Circle = Circle->new(5);
my $Rectangle = Rectangle->new(20,20);
print $Circle->get_radius() . "\n";
print $Rectangle->get_dimension() . "\n";
print $Circle->type() . "\n";
print $Rectangle->type() . "\n";