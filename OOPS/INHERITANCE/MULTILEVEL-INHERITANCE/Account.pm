package Account;
use strict;
use warnings;

sub new{
    my ($class , $balance) = @_;
    my $self = {
        balance => $balance,
    };

    bless $self , $class;
    return $self;
}

sub get_balance {
    my ($self) = @_;
    return $self->{balance};
}
1;
