use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/INHERITANCE/HIERARCHICAL-INHERITANCE";
use EmailNotification;
use SMSNotification;
use PushNotification;

my $email = EmailNotification->new("useremail.com" , "Welcome");
my $sms = SMSNotification->new("9115481930", "OTP: 1234");
my $push = PushNotification->new("Device_Iphone", "New Alert");

print $email->send() . "\n";
print $sms->send() . "\n";
print $push->send() . "\n";

