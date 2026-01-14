<<<<<<< HEAD
use strict;
use warnings;

my @arr = (1, 2, 3, 4, 5, 6, 7);

my $k = 4;
my $n = scalar @arr;

for (my ($start, $end) = (0, $n - 1); $start < $end; $start++, $end--) {
    
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
for (my ($start, $end) = (0, $k - 1); $start < $end; $start++, $end--) {
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
for (my ($start, $end) = ($k, $n - 1); $start < $end; $start++, $end--) {
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
=======
use strict;
use warnings;

my @arr = (1, 2, 3, 4, 5, 6, 7);

my $k = 4;
my $n = scalar @arr;

for (my ($start, $end) = (0, $n - 1); $start < $end; $start++, $end--) {
    
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
for (my ($start, $end) = (0, $k - 1); $start < $end; $start++, $end--) {
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
for (my ($start, $end) = ($k, $n - 1); $start < $end; $start++, $end--) {
    my $temp = $arr[$start];
    $arr[$start] = $arr[$end];
    $arr[$end] = $temp;
}
>>>>>>> master
print "AFTER ROTAION: ", join( " ", @arr), "\n";