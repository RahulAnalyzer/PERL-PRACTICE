use strict;
use warnings;

sub extract_url_parts {
    my ($url) = @_;

    # One regex only
    if ($url =~ m{^(https?://[^/]+)(/.*)?$}) {
        my $base = $1;
        my $path = $2 // '';

        return ($base, $path);
    }

    return;  # invalid URL format print kr dega

}


my $input = "https://example.com/products/item1";

my ($base_url, $path) = extract_url_parts($input);

print "Base URL: $base_url\n";
print "Path: $path\n";



=begin
use strict;
use warnings;

sub extract_url_parts {
    my ($url) = @_;

    if ($url =~ m{^(https?://[^/]+)(/.*)?$}) {
        my $base = $1;
        my $path = $2 // '';
        return ($base, $path);
    }

    return;
}


print "Enter URL: ";
chomp(my $input = <STDIN>);

my ($base_url, $path) = extract_url_parts($input);

if (defined $base_url) {
    print "Base URL: $base_url\n";
    print "Path: $path\n";
} else {
    print "Invalid URL format\n";
}

=end
=cut