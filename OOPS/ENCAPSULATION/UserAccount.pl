use strict;
use warnings;

BEGIN{
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\ENCAPSULATION';
}
use UserAccount;

print "ENTER THE USERNAME: \n";
chomp(my $user = <STDIN>);

my $User_Account = UserAccount->new($user);
 
print "Enter the Password (New Password)\n";
chomp(my $pass = <STDIN>);

$User_Account->set_password($pass);

print "User detail\n" . $User_Account->get_username() . "\n";
print "CHECKING PASSWORDS VALIDATION\n";

if($User_Account->check_password("Rahul@819")){
    print "Password matched\n";
}else{
    print "Password did not match\n";
}
