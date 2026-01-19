use strict;
use warnings;
use FindBin qw($Bin);

# 1) MATCHING (m//) Extract only line that match pattern
sub print_matching_line{
    my ($file,$pattern) = @_;
    warn "PATTERN = [$pattern]\n";

    open my $fh,'<',$file or die $!;
    while(my $line = <$fh>){
        print $line if $line =~ /$pattern/;
    }
    close $fh;
}
my $file_path = "$Bin/../TEXT/TESTING_FILE.txt";
print_matching_line($file_path,'are')


