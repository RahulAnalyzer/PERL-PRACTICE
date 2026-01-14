use strict;
use warnings;

# create a file name as perl_create_file
my $create_file = 'perl_create_file.txt';

# opening perl_create_file file for write operation
open(my $fh, '>', $create_file) or die "File is not opening '$create_file' $!";

# #writing below content in perl_create_file file
print $fh "File is created in perl\n";

# #closing the file;
close $fh;
print "file closed\n";
