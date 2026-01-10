# Detect Duplicates with Positions
# Task:
#  Return values that appear more than once along with their indices.
# Input:
# ["a","b","a","c","b"]

# Output:
# a => [0,2]
# b => [1,4]

my @array = ("a","b","a","c","b");
my %postion;

for (my $i =0; $i < @array; $i++){
    push @{$postion{$array[$i]}} , $i;
}

while (my ($value, $indices) = each %postion){
    if (scalar @$indices > 1){
       print "$value => [" . join(",", @$indices) . "]\n";

    }
}