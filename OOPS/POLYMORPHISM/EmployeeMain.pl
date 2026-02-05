use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/POLYMORPHISM";
 

use FullTimeEmployee;
use ContractEmployee;

my @employee = (
    FullTimeEmployee->new(montly_salary => 50000),
    ContractEmployee->new(hourly_rate => 500 , hourly_worked => 80),
);

foreach my $emp(@employee){
    print "Salary: " .$emp->calculate_salary() . "\n";
}