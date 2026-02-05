package ContractEmployee;
use strict;
use warnings;
use parent 'Empolyee';

sub calculate_salary{
    my ($self) = @_;
    return $self->{hourly_rate} * $self->{hourly_worked};
}
1;

