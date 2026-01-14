use strict;
use warnings;
use FindBin qw($Bin);
use File::Spec;


my $file_path = File::Spec->catfile($FindBin::Bin, 'TEXT', 'rahul.txt');

open (my $fh, "+<", $file_path) or die $!;

my $first_line = <$fh>;
print "FIRST LINE : $first_line";

seek ($fh, 0,2); #move to end;
print $fh "ADDED USING +< mode\n";
close $fh


#IN THIS WE ARE RADING THE FILE AND WRITNG IN THE FILE AT THE SAME TIME WITHOUT THE TRUNCATING THE FILE SAFELY 