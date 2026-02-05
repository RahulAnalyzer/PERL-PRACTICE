use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/ABSTRACTION";
use Circle;
use Rectangle;

my @shape = (
    Circle->new(5),
    Rectangle->new(10,20),
);

foreach my $shape (@shape){
    print "Area: " , $shape->area() . "\n";
}

