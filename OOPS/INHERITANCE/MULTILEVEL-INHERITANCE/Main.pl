use strict;
use warnings;

BEGIN{
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\MULTILEVEL-INHERITANCE';
};
use Manager;

my $mgr = Manager->new("Rahul Singh" , 101 , "IT");

print "EMPLOYEE NAME: " . $mgr->get_name() . "\n"; # from person
print "EMPLOYEE ID: " . $mgr->get_emp_id() . "\n"; # from Employee
print "EMPLOYEE DEPARTMENT: " . $mgr->get_department() . "\n"; # from manager