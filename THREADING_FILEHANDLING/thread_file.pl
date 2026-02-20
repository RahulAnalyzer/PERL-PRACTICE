use strict;
use warnings;
use threads;

use Cwd;

sub count_lines {
    my ($filename) = @_;

    print "Trying to open: ", getcwd(), "\\$filename\n";

    open(my $fh, "<", $filename) or die "Cannot open $filename: $!";

    my $count = 0;
    while (<$fh>) {
        $count++;
    }

    close($fh);

    print "File: $filename -> Lines: $count\n";

    return $count;
}

my @files = (
"THREADING_FILEHANDLING/file1.txt",
"THREADING_FILEHANDLING/file2.txt",
"THREADING_FILEHANDLING/file3.txt",
"THREADING_FILEHANDLING/file4.txt",
"THREADING_FILEHANDLING/file5.txt",
);


my @threads;

foreach my $file (@files){
    push @threads , threads->create(\&count_lines , $file);
}
my $total = 0;
foreach my $t (@threads){
    $total += $t->join();
}

print "Total Lines in all Files: $total\n";