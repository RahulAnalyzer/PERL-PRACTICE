package Circle;
use strict;
use warnings;
use parent 'Shape';

sub new{
    my ($class , $radius) = @_;
    my $self = $class->SUPER::new();
    $self->{radius} = $radius;
    return $self;
}

sub get_radius{
    my ($self) = @_;
    return $self->{radius};
}
sub type{
    return "Circle";
}

1;