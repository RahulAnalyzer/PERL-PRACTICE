package Employee;
use strict;
use warnings;
use parent 'Person';

sub new{
    my ($class , $name , $emp_id) = @_;
    my $self = $class->SUPER::new($name);
    $self->{emp_id} = $emp_id;

    return $self;
}

sub get_emp_id{
    my ($self) = @_;
    return $self->{emp_id};
}
1;