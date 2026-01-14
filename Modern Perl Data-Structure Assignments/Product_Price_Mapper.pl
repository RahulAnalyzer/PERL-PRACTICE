<<<<<<< HEAD
use strict;
use warnings;

print "Enter a product name: ";
chomp (my $product = <STDIN>);
my @arr1 = split(/\s+/ , $product);

print "Enter a product price: ";
chomp (my $price = <STDIN>);
my @arr2 = split(/\s+/ , $price);

if (scalar @arr1 != scalar @arr2){
    print "Array are not equal length\n";
    exit;
}

my %hash;
for(my $i = 0; $i < @arr1; $i++){
    $hash{$arr1[$i]} = $arr2[$i];
}

for my $key (keys %hash){
    print "$key => $hash{$key}\n";
=======
use strict;
use warnings;

print "Enter a product name: ";
chomp (my $product = <STDIN>);
my @arr1 = split(/\s+/ , $product);

print "Enter a product price: ";
chomp (my $price = <STDIN>);
my @arr2 = split(/\s+/ , $price);

if (scalar @arr1 != scalar @arr2){
    print "Array are not equal length\n";
    exit;
}

my %hash;
for(my $i = 0; $i < @arr1; $i++){
    $hash{$arr1[$i]} = $arr2[$i];
}

for my $key (keys %hash){
    print "$key => $hash{$key}\n";
>>>>>>> master
}