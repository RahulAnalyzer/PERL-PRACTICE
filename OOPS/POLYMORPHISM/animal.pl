use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/POLYMORPHISM";
use Dog;
use Cat;
use Cow;

my @Animal = (
    Dog->new(),
    Cat->new(),
    Cow->new(),
);

foreach my $animal (@Animal){
    print $animal->make_sound() . "\n";
}