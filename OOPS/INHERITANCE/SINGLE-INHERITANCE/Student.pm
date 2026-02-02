package Student;
use strict;
use warnings;
use parent 'SingleInheritance';

sub new{
    my ($class , $name  , $roll_no) = @_;

    my $self = $class->SUPER::new($name);

    $self->{roll_no} = $roll_no;

    return $self;
}

sub get_roll_no{
    my ($self) = @_;
    return $self->{roll_no};
}
1;
