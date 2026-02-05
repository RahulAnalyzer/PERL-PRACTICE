package Shape;
use strict;
use warnings;

sub new{
    my ($class) = @_;
    bless {} , $class;
}

sub area{
    die "Area() must be implemented by the subclass\n";
}
1;
#What this means
#Shape defines the rule
#area() is mandatory
#Parent refuses to guess implementation
#This is abstract behavior.