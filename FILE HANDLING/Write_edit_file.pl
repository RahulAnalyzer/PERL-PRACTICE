
use warnings;
use Cwd;
print "Running From: ", getcwd(), "\n";



# openingn File Hello.txt in Read mode
chdir "FILE HANDLING" or die "Cannot change directory: $!";
open(my $r, "<", "TEXT/rahul.txt") or die $!;



#Printing the existing content of the file
print("Exiting Content of Hello.txt: " . <r>);

# opening File in write mode
open(my $w,">", "TEXT/rahul.txt") or die "Cannot Write to this hello.txt File: $!";

# Set r to the beginnig of hello.txt
seek ($r, 0, 0);

print "\nWriting to File....";

#writing to hello.txt using print
print $w "HI I AM RAHUL SINGH AND AGAIN I CHANGE THE PATH\n";

close $r;
close $w;