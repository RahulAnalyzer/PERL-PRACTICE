package Manager;
use strict;
use warnings;
use parent 'Employee';

sub new{
    my ($class , $name , $emp_id , $dept) = @_;

    my $self = $class->SUPER::new($name , $emp_id);
    $self->{dept} = $dept;
    return $self;
}

sub get_department{
    my ($self) = @_;
    return $self->{dept};
}

1;