use strict;
use warnings;

# 1) ------- NORMAL INLINE - SAFE LINE BY LINE READ ------
open my $fh,'<','bigfile.txt' or die $!;
while (my $line = <fh>){
    # process one line at a time
    print $line;
}
close $fh;

# --- SUBROUTINE -----
sub read_large_file {
    my ($file) = @_;

    open my $fh, '<', $file or die $!;

    while (my $line = <$fh>) {
        print $line;
    }

    close $fh;
}

# -------- MAIN --------
read_large_file('bigfile.txt');

# 2) ------ CHUNKED READING -------
# huge text files
# binary files
# network like processing

open my $fh, '<', 'hugefiles.txt' or die $!;

while (read($fh,my $buffer,4096)){
    print $buffer;

}close $fh;

# why this matter?
# contant memory usage
# works for GB sized files
# faster than line by line in many cases

# Using `while (read($fh, $buffer, 4096)) { print $buffer }` reads the file in 4096-byte chunks, printing each chunk. It efficiently handles large files without loading everything into memory. However, partial lines may occur; additional logic is needed to process complete lines if necessary

# ------- SUBROUTINE VERSION ------

sub read_in_chunks {
    my ($file) = @_;

    open my $fh, '<', $file or die $!;

    while (read($fh, my $buf, 4096)) {
        print $buf;
    }

    close $fh;
}

# -------- MAIN --------
read_in_chunks('hugefile.txt');

=begin
Here are common buffer sizes in bytes for file reading in Perl:

1024 (1 KB)  
2048 (2 KB)  
4096 (4 KB)  
8192 (8 KB)  
16384 (16 KB)  
32768 (32 KB)  
65536 (64 KB)  
131072 (128 KB)  
262144 (256 KB)  
524288 (512 KB)  
1048576 (1 MB)  

Choosing a buffer size depends on system memory and performance requirements.
=end
=cut


# 3) ------- PROCESS LARGE FILE + WRITE OUTPUT SAFELY (This is very real world)

open my $in,  '<', 'input.txt'  or die $!;
open my $out, '>', 'output.txt' or die $!;

while (my $line = <$in>) {
    next if $line =~ /^\s*$/;   # skip empty lines
    print $out $line;
}

close $in;
close $out;

#----- SUBROUTINE ----------
sub filter_large_file {
    my ($infile, $outfile) = @_;

    open my $in,  '<', $infile  or die $!;
    open my $out, '>', $outfile or die $!;

    while (my $line = <$in>) {
        next if $line =~ /^\s*$/;
        print $out $line;
    }

    close $in;
    close $out;
}

# -------- MAIN --------
filter_large_file('input.txt', 'output.txt');