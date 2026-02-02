use strict;
use warnings;
BEGIN{
    push @INC ,'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\MULTILEVEL-INHERITANCE';
};
use SavingAccount;

my $b1 = SavingAccount->new(1000);
$b1->add_interest(1);
$b1->deposit(200);

print "LATEST BALANCE: " . $b1->get_balance() . "\n";