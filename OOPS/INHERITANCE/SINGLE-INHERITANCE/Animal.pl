use strict;
use warnings;
BEGIN{
    push @INC, 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\SINGLE-INHERITANCE';
};
use dog;

my $dog = dog->new("Tommy");
print $dog->eat() . "\n";
print $dog->bark() . "\n";