use strict;
use warnings;
use FindBin qw($Bin);

my $file_path = "$Bin/../TEXT/app.conf";

# my %conf;
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


# ------ SUBROUTINE TYPE ---------

sub read_config{
    my ($file) = @_;
    my %config;

    open my $fh , '<', $file_path or die $!;

while(my $line = <$fh>){
    chomp  $line;
    next if $line =~ /^\s*$/; #skip empty line
    next if $line =~ /^\s*#/; # skip the comments

    if($line =~ /^\s*(\w+)\s*=\s*(.+)\s*$/){
       $config{$1} = $2;
    }
    
}
close $fh;
return %config;

}

# ------------- MAIN --------------
my %cfg = read_config($file_path);
print "Host: $cfg{host}\n";
print "Port: $cfg{port}\n";
print "Timeout: $cfg{timeout}\n";



