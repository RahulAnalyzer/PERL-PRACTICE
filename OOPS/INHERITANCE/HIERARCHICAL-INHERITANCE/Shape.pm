package Shape;
use strict;
use warnings;

sub new{
    my ($class) = @_;
    my $self = {};
    bless $self , $class;
    return $self;
}

sub type{
    return "Generic Shape: ";
}
1;