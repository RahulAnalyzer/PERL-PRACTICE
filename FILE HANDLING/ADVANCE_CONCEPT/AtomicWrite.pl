use strict;
use warnings;


my $real = "data.txt";
my $temp = "data.txt.tmp";

open my $fh, '>', $temp or die "Cannot open the temp file $!";

print $fh "This Safe Content";
close $fh;

rename $temp , $real or die "Cannot rename the file $!";

# --- Writing this in Subroutine ------

sub atomic_write{
    my ($file, $content) = @_;
    my $tmp = "$file.tmp";

    open my $fh , '>', $tmp or die "Cannot Open temp File:$!";
    print $fh $content;
    close $fh;

    rename $tmp, $file or die "Rename Failed:$!";
}
#---- MAIN ------
atomic_write("data.txt", "This is atomic write Content\n");