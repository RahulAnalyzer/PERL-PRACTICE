sub normalize_filename 
{
    my ($filename) = @_;

    $filename = lc($filename);

    $filename =~ s/\s+/_/g; # convert the whitespace to underscore
    $filename =~ s/[^a-z0-9._-]/_/g; # it remmoving the illegal chars
    $filename =~ s/_+/_/g; # collapse multiple underscores
    $filename =~ s/_\.txt$/\.txt/;

    return $filename;
}

my $input = "My Report FINAL!! .txt";
my $output = normalize_filename($input);

print "INPUT WE PUT: $input\n";
print "OUTPUT AFTER NORMALIZATON: $output\n";

