use strict;
use warnings;
print"ENTER THE USERNAME\n";
my $identifier = <STDIN>;
chomp($identifier);
if (
    $identifier =~ m{
        ^
        ([a-zA-Z]                       # starts with a letter
         [a-zA-Z0-9]*                   # alphanumerics
         (?:\.[a-zA-Z0-9]+)*            # dots only between alphanumerics
        )
        @
        ([a-z]{2,})                     # department
        \.
        ([a-z]{3,})                     # company
        $
    }x
    && length($1) >= 3 
) {
    print "Username   : $1\n";
    print "Department : $2\n";
    print "Company    : $3\n";
} else {
    print "Invalid identifier\n";
}


