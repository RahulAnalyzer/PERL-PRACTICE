package FullTimeEmployee;
use strict;
use warnings;
use parent 'Empolyee';

sub calculate_salary{
    my ($self) = @_;
    return $self->{montly_salary};
}
1;