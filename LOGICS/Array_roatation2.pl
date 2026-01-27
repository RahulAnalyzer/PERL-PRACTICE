use strict;
use warnings;


my @arr = (1,2,3,4,5,6,7);
my $k = 3;

print "Orginal array dekh leh: @arr\n";
print "Number of Roation bhi dekh leh: $k\n\n";

my @orginal_array = @arr;
my $length = scalar @arr;


for(my $rotation = 0; $rotation < $k; $rotation++){
    my $last = $arr[$length - 1];
    
    for(my $i = $length - 1; $i > 0; $i--){
        $arr[$i] = $arr[$i - 1];
        
    }
    $arr[0] = $last; # put the last element at first;
    print "After rotation " . ($rotation + 1 ) . ": @arr\n";

}
print "\nFinal rotated array: @arr\n";