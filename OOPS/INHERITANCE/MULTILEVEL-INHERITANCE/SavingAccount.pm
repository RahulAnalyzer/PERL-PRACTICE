package SavingAccount;
use strict;
use warnings;
use parent 'BankAccount';

sub add_interest{
    my ($self, $rate) = @_;
    $self->{balance} += $self->{balance} * $rate / 100;
}
1;