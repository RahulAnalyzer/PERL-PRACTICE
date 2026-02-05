=begin
Problem: Employee Salary Calculation
Scenario
Different employees calculate salary differently, but payroll should not care how.

Design
Parent:
Employee
method: calculate_salary() (must exist)

Children:
FullTimeEmployee
ContractEmployee

Rules:
FullTimeEmployee → monthly fixed salary
ContractEmployee → hourly_rate × hours_worked
=end
=cut
package Empolyee;
use strict;
use warnings;

sub new{
    my ($class , %args) = @_;
    my $self = \%args;
    bless $self , $class;
    return $self;
}

sub Calculate_Salary{
    die "Calculate_salary() must be implemented by subclass\n";
}
1;