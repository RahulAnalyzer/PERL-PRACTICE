package BankAccount;
use strict;
use warnings;
use parent 'Account';

sub deposit{
    my ($class , $amount) = @_;
    my $self->{balance} += $amount;
}

1;