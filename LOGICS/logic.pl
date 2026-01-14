<<<<<<< HEAD
use strict;
use warnings;

my $text = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

# # 1. Count non-empty lines
# my @lines = split "\n", $text;
# my $non_empty = 0;

# foreach my $line (@lines) {
#     if ($line =~ /\S/) {
#         $non_empty++;
#     }
# }
# print "Non-empty lines: $non_empty\n";




# my $input = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

# my $new_string = $input;
# $new_string =~ s/\n//g;

# print $new_string;

# my $text = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

print "ENTER A WORD TO MATCH: ";
chomp(my $word = <STDIN>);

if ($text =~ /$word/i) {
    print "word found\n";
} else {
    print "not found\n";
}


#  Counts unique words (case-insensitive) 
my %seen;
for my $word (split /\W+/, $text) {
    if( length $word == 0){
        next;
    }
    $seen{lc $word} = 1;
}

my $unique_words = keys %seen;

print "Unique words found: " . join(", ", sort keys %seen) . "\n";
print "Count of unique words: $unique_words\n";

# Count characters
my $char_count = length($text);
print "Total number of characters: $char_count\n";

=======
use strict;
use warnings;

my $text = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

# # 1. Count non-empty lines
# my @lines = split "\n", $text;
# my $non_empty = 0;

# foreach my $line (@lines) {
#     if ($line =~ /\S/) {
#         $non_empty++;
#     }
# }
# print "Non-empty lines: $non_empty\n";




# my $input = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

# my $new_string = $input;
# $new_string =~ s/\n//g;

# print $new_string;

# my $text = "Perl is powerful.\n\nPerl is GREAT for text processing!\nperl, PERL...";

print "ENTER A WORD TO MATCH: ";
chomp(my $word = <STDIN>);

if ($text =~ /$word/i) {
    print "word found\n";
} else {
    print "not found\n";
}


#  Counts unique words (case-insensitive) 
my %seen;
for my $word (split /\W+/, $text) {
    if( length $word == 0){
        next;
    }
    $seen{lc $word} = 1;
}

my $unique_words = keys %seen;

print "Unique words found: " . join(", ", sort keys %seen) . "\n";
print "Count of unique words: $unique_words\n";

# Count characters
my $char_count = length($text);
print "Total number of characters: $char_count\n";

>>>>>>> master
