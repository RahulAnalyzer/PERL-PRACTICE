my %conf;
# open my $fh , '<', $file_path or die $!;

# while(my $line = <$fh>){
#     chomp  $line;
#     next if $line =~ /^\s*$/; #skip empty line
#     next if $line =~ /^\s*#/; # skip the comments

#     if($line =~ /^\s*(\w+)\s*=\s*(.+)\s*$/){
#         my $key = $1;
#         my $value = $2;
#         $conf{$key} = $value;
#     }
    
# }
# close $fh;
# print "Host: $conf{host}\n";
# print "Port: $conf{port}\n";
# print "Debug: $conf{debug}\n";