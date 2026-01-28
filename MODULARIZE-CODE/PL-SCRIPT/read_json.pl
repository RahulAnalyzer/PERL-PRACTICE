use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";
use My::FileUtils qw(read_json);

my $input_file = "$Bin/../DATA/output.json";
my $data = read_json($input_file);
print "Data read from $input_file:\n";
for my $entry (@$data) {
    print "Name: $entry->{Name}, Age: $entry->{Age}, City: $entry->{City}\n";
}
