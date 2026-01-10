use strict;
use warnings;

sub clean_csv_text {
    my ($text) = @_;

    # Remove special characters
    $text =~ s/[!@#$%^&*]+//g;

    # Normalize commas and surrounding spaces
    $text =~ s/\s*,\s*/, /g;

    # Remove empty fields 
    $text =~ s/(^,|,$)//g;
    $text =~ s/,\s*,/, /g while $text =~ /,\s*,/;

    # Trim leading and trailing spaces safely
    $text =~ s/^\s+|\s+$//g;

    return $text;
}

print "Enter CSV text: ";
chomp(my $input = <STDIN>);

my $result = clean_csv_text($input);

print "Cleaned Output: $result\n";
