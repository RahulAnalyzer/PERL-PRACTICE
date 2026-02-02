=begin
Attributes:
account_no
balance (default = 0)

Methods:
get_balance
deposit(amount) → amount > 0
withdraw(amount) → cannot go negative

Rules:
NO {} access in main
validation inside setters/methods
=end
=cut
package EnBank;
use strict;
use warnings;

sub new{

    my ($class , $account_no) = @_;
    my $self = {
        account_no => $account_no,
        balance => 0,
    };
    bless $self , $class;
    return $self;
}

sub get_account_no{
    my ($self) = @_;
    return $self->{account_no};
}

sub get_balance{
    my ($self) = @_;
    return $self->{balance};
}

# deposit Money 
sub get_deposit{
    my ($self , $deposit) = @_;
    die "Deposit Money must be positive\n" if $deposit <= 0;
    $self->{balance} += $deposit;
}

#withdrawal

sub withdraw{
    my ($self , $deposit) = @_;
    die "Withdraw amount must be postive\n" if $deposit <= 0;
    die "Insufficent Amount\n" if $deposit > $self->{balance};
    $self->{balance} -= $deposit;
}
1;