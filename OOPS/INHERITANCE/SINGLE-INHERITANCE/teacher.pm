package teacher;
use strict;
use warnings;
use parent 'Person';

sub new {
    my ($class , $name , $subject) = @_;
    my $self = $class->SUPER::new($name);
    $self->{subject} = $subject;
    return $self;
}

sub get_subject{
    my ($self) = @_;
    return $self->{subject};
}

1;