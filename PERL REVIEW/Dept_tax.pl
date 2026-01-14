use strict;
use warnings;

my @employees = (
    { name => "Alice", dept => "IT", salary => 60000 },
    { name => "Bob",   dept => "HR", salary => 45000 },
    { name => "Riya",  dept => "IT", salary => 80000 },
    { name => "John",  dept => "Ops", salary => 50000 },
);

my @result;
foreach my $emp (@employees){
    if ($emp ->{salary} > 50000){
        my $tax = $emp->{salary} * 0.10;
        push @result, {
            name => $emp->{name},
            dept => $emp->{dept},
            salary => $emp->{salary},
            tax => $tax,
        };
    }
}

for my $record(@result){
    print "{\n";
    print "name => $record->{name},
      dept => $record->{dept} , 
      salary => $record->{salary} , 
      tax => $record->{tax}\n"
}
print "}\n";

