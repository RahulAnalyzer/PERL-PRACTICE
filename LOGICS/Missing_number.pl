use strict;
use warnings;


my @arr = (1,2,4,5);
my $N = scalar (@arr) + 1;

my $arr_sum = 0;
my $total_number = $N * ($N + 1) / 2;

foreach my $x (@arr){
    $arr_sum += $x;
}
my $missing = $total_number - $arr_sum;
print "$missing\n";