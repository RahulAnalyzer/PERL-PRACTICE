# Problem 7

use strict;
use warnings;

my @data  = ("Electronics", 1000, "Furniture", 2000, "Electronics", 1500);
my %sum;

for(my $i = 0; $i < @data; $i += 2){
    $sum{$data[$i]} += $data[$i + 1];
}

foreach my $product (sort keys %sum){
    print "$product: $sum{$product}\n";
}