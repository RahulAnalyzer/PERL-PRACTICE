use strict;
use warnings;
BEGIN{
    push @INC, 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/BASIC-OOPS';
};
use BankAccount;

my $acc1 = BankAccount->new(123456789, "Rahul Singh" , 50000);
$acc1->deposit_amount(5000);
$acc1->withdraw_amount(2000);
$acc1->get_balance();