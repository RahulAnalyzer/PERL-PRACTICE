package Rectangle;
use strict;
use warnings;
use parent 'Shape';

sub new{
    my ($class , $length , $width) = @_;
    my $self = $class->SUPER::new();
    $self->{length} = $length;
    $self->{width} = $width;
    return $self;
}

sub get_dimension {
    my ($self) = @_;
    return ($self->{length} , $self->{width});
}
sub type{
    return "Rectangle";
}
1;