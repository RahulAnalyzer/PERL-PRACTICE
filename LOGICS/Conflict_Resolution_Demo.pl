#!/usr/bin/perl
use strict;
use warnings;

# Conflict_Resolution_Demo.pl
# This script demonstrates the logic used to identify and resolve
# identical merge conflict blocks in a repository.

sub resolve_identical_conflict {
    my ($file_content) = @_;

    # Regex to find conflict blocks
    # <<<<<<< HEAD
    # (content A)
    # =======
    # (content B)
    # >>>>>>> master

    if ($file_content =~ /<<<<<<< HEAD\n(.*?)\n=======\n(.*?)\n>>>>>>> master/s) {
        my $head = $1;
        my $master = $2;

        # Normalize for comparison (remove carriage returns)
        my $head_norm = $head;
        my $master_norm = $master;
        $head_norm =~ s/\r//g;
        $master_norm =~ s/\r//g;

        if ($head_norm eq $master_norm) {
            print "Blocks are identical. Resolving...\n";
            $file_content =~ s/<<<<<<< HEAD\n.*?\n=======\n(.*?)\n>>>>>>> master/$1/s;
            return $file_content;
        } else {
            print "Blocks are different. Manual resolution required.\n";
        }
    } else {
        print "No conflict markers found.\n";
    }
    return $file_content;
}

# Example usage:
my $example = <<'END';
use strict;
<<<<<<< HEAD
print "Hello World\n";
=======
print "Hello World\n";
>>>>>>> master
END

print "Before:\n$example\n";
my $resolved = resolve_identical_conflict($example);
print "After:\n$resolved\n";
