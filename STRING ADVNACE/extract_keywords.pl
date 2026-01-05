use strict;
use warnings;

sub extract_keywords {
    my ($text, @keywords) = @_;

    my %seen;
    my @matches;

    
    my $pattern = join '|', map { quotemeta } @keywords;

    while ($text =~ /\b($pattern)\b/ig) {
        my $found = $1;

       
        unless ($seen{lc $found}) {
            push @matches, $found;
            $seen{lc $found} = 1;
        }
    }

    return @matches;
}

print "Enter resume text:\n";
chomp(my $resume = <STDIN>);

print "Enter keywords (comma-separated): ";
chomp(my $kw_input = <STDIN>);

# split keywords and clean spaces
my @keywords = map { s/^\s+|\s+$//gr } split /,/, $kw_input;

my @result = extract_keywords($resume, @keywords);

if (@result) {
    print "Matched keywords: (@result)\n";
} else {
    print "No keywords matched\n";
}
