use strict;
use warnings;

BEGIN{
    push @INC, 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/BASIC-OOPS';

};
use Employee;

my $emp1 = Employee->new(100, "Rahul" , 10000);
my $emp2 = Employee->new(101, "Sehaj" , 15000);
my $emp3 = Employee->new(102, "Raghav" , 20000);

$emp1->get_details();
$emp1->salary_increament(10);
$emp1->get_salary();
