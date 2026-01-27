use strict;
use warnings;

print "Enter X coordinate: ";
chomp(my $x = <STDIN>);

print "Enter Y coordinate: ";
chomp(my $y = <STDIN>);

print "Enter Z coordinate: ";
chomp(my $z = <STDIN>);

my @array = ($x,$y,$z);
my ($a, $b, $c) = @array;


print "Coordinate : X=$a , Y=$b , Z=$c\n";