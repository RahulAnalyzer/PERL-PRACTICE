use strict;
use warnings;
BEGIN{
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\ENCAPSULATION';
};
use EnBank;
print "Enter the Account No: \n";
chomp(my $no = <STDIN>);

my $account = EnBank->new($no);

print "Enter the Deposit Amount\n";
chomp(my $am = <STDIN>);

$account->get_deposit($am);

print "Enter the Withdraw money :\n";
chomp(my $with = <STDIN>);

$account->withdraw($with);

print "\n ACCOUNT NO:- " . $account->get_account_no() . "\n";
print "\nTOTAL BALANCE:-" . $account->get_balance() . "\n";