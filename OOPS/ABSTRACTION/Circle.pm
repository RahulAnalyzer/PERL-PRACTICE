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

sub area{
    my ($self) = @_;
    return 3.14 * $self->{radius} * $self->{radius};
}
1;