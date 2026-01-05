use strict;
use warnings;

my @input = (
    ["IT", "ALEX"],
    ["HR", "Riya"],
    ["IT", "John"]

);

my %Departement_emp;
foreach my $pair(@input){
    my ($dept , $employee) = @$pair;
    
    push @{$Department_emp{$dept}}, $employee;
}
print "{\n";
for my $dept (sort keys %Departement_emp){
    print "$dept => [\"", join('","', @{$Department_emp{$dept}}), "\"],\n";
}
print "}\n";