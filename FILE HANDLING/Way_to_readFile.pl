use strict;
use warnings;


# first , Create a test file to work with;
open (my $out , '>', '/tmp/testfile.txt') or die $!;
print $out "Line $_\n" for 1..10;
close ($out);

# method 1 read line by line
open(my $fh, '<', '/tmp/testfile.txt') or die $!;
print "== METHOD 1: LINE BY LINE ==\n";
while(my $line =<$fh>){
    chomp $line;
    print "$line\n";
}
close($fh);


#method 2 Read entire file at once into an array 
open( $fh, '<', '/tmp/testfile.txt') or die $!;
my @all_line  = <$fh>; #read all line at once
close ($fh);

print "\n== METHOD 2: Entire File Into Array==\n";
chomp @all_line;
print "Total Lines: " . scalar(@all_line) ."\n";
print "Third line: $all_line[2]\n";


#method 3 Read enitre file into one  string slurp
open( $fh, '<' , '/tmp/testfile.txt') or die $!;
my $entier_file = do {
    local $/; 
    <$fh>
};
close($fh);

print "\n=== METHOD 3: Entire FILE AS ONE STRING ==\n";
my $line_count = () = $entier_file =~ /\n/g; # count newline
print "File has $line_count lines\n";
print "Contain Line 5: " . ($entier_file =~ /Line 5/ ? "yes": "no") . "\n";