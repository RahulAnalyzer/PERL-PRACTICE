my $output = `wmic cpu get loadpercentage`;

# if($output =~ /(\d+)/){
#     my $cpu = $1;
#     print "CPU Usage: $cpu%\n";
# }else{
#     print "Could not read CPU\n";
# }
