# use strict;
# use warnings;

# open(my $fh, ">>", 'TEXT/rahul.txt') or die "File cannot append in this file: $!";

# print $fh "This line is added in the end of this text file as a proof of Append function\n";
# close $fh;    
use Cwd;

use strict;
use warnings;
use File::Spec;
use FindBin;

my $file_path = File::Spec->catfile($FindBin::Bin, 'TEXT', 'rahul.txt');

open(my $fh, ">>", $file_path) or die $!;

# open(my $fh, ">>", "FILE HANDLING/TEXT/rahul.txt")
#     or die "File cannot append in this file: $!";

print $fh "This line is added in the end of this text file as a proof of Append function again checking round 2\n";

close $fh;
