use strict;
use warnings;

# my $output = `wmic cpu get loadpercentage`;

# if($output =~ /(\d+)/){
#     my $cpu = $1;
#     print "CPU Usage: $cpu%\n";
# }else{
#     print "Could not read CPU\n";
# }

# Program For The Memory
my $output = `wmic OS get FreePhysicalMemory, TotalVisibleMemorySize`;

print "Raw Output: \n$output\n";

if($output =~ /(\d+)\s+(\d+)/){
    my $free = $1; # free memory in KB
    my $total = $2; #total memory in KB

    # calculate what percentage is USED
    my $used_percent = (($total - $free) / $total) * 100;
    my $used_int = int($used_percent); # remove decimals

    print "Free: $free KB\n";
    print "Total: $total kb\n";
    print "Used: $used_int%\n";
}else{
    print "Error:\n";
}