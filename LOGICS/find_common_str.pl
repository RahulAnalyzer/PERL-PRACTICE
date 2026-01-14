use strict;
use warnings;
my @arr1 = qw(a b c d e);
my @arr2 = qw(b c e f d);  # outpur (bcde)


my %seen;
$seen{$_} = 1 for @arr1;
my @common = grep {$seen{$_}} @arr2;
print @common;
