package BankAccount;
use strict;
use warnings;

sub new {
    my ($class, $account_no , $holder_name , $balance) = @_;

    my $self = {
        account_no => $account_no,
        holder_name => $holder_name,
        balance => $balance,
    };

    bless $self , $class; # treat this reference as an object of this package
    return $self;
}

sub deposit_amount{
    my ($self , $deposite_amount) = @_;

    if ($deposite_amount > 0){
        
        $self->{balance} += $deposite_amount;
        print "Deposit done! New Balance: $self->{balance}\n";
        
    }
    else
    {
        print "Invalid Deposite Balance\n";
    }
}

sub withdraw_amount{
    my ($self ,$withdraw_amount) = @_;

    if ( $withdraw_amount >  $self->{balance} )
    {
        print "Insufficent Balance To withdraw\n";
    }elsif($withdraw_amount <= 0)
    {
        
        print "Invalid Withdraw Amount!\n";
    }
    else
    {
        $self->{balance} -= $withdraw_amount;
        print "Withdrawal SuccessFull? Remaining Balance: $self->{balance}\n";
    }
}


sub get_balance{
    my ($self) = @_;
    print "TOTAL BALANCE: $self->{balance}\n";
}
1;