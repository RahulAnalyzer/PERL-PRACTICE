use strict;
use warnings;

sub rle_compress {
    my ($text) = @_;

   
    $text =~ s/(.)\1*/$1 . length($&)/ge;

    return $text;
}

print "Enter text to compress: ";
chomp(my $input = <STDIN>);

my $compressed = rle_compress($input);

print "Compressed output: $compressed\n";
