use Cwd;
print "Running From: ", getcwd(), "\n";


use strict;
use warnings;


open(my $fh, '<', 'FILE HANDLING/hello.txt') or die "Cant open File at this moment";
while (my $line = <$fh>){
    print $line;
}

close($fh);