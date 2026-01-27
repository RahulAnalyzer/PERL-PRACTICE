use strict;
use warnings;
use XML::Simple;
use Data::Dumper;

sub read_xml_file{
    my ($file) = @_;
    open my $fh, '<', $file or die "cannot open $file:$!";
    my $xml_content = do {
        local $/;
        <$fh>;
    };
    close $fh;
    my $xml = XML::Simple->new();
    return $xml->XMLin($xml_content);
}

my $data = read_xml_file("FILE HANDLING\\TEXT\\data.xml");
print Dumper($data);