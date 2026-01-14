# IN THIS WE WILL GET TO KNOW THAT HOW TO WRITE THE FILE HANDLING CODE IN THE FORM OF SUBROUTINES

# 1) READ a File (Return Content)

use strict;
use warnings;
use FindBin qw($Bin);
use File::Spec;


my $file_path = File::Spec->catfile($Bin, 'TEXT', 'rahul.txt');

sub read_file{
    my ($path) = @_;

    open(my $fh, '<', $path) or die "Cannot read $path: $!";
    my @line = <$fh>;
    close $fh;

    return @line;
}
$file_path = 

my @content = read_file($file_path);
print @content;