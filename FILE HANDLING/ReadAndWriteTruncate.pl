use strict;
use warnings;
use FindBin qw($Bin);
use File::Spec;


my $file_path = File::Spec->catfile($FindBin::Bin, 'TEXT', 'rahul.txt');

open(my $fh, "+>", $file_path)
or die "Cannot open sorry: $!";

seek($fh,0,0);
print "First Line: <$fh>";
print $fh "Old Content is gone\n";
close $fh;


