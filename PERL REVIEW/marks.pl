use strict;
use warnings;

# Original hash
my %scores = (
    'Math' => 81,
    'Physics' => 83,
    'Chemistry' => 87,
);


my @sorted = sort { $scores{$b} <=> $scores{$a} } keys %scores;

# Create array of tuples
my @result;
foreach my $subject (@sorted) {
    push @result, [$subject, $scores{$subject}];
}

# Print the result
use Data::Dumper;
print Dumper(\@result);


# print "[";
# my @formatted;
# foreach my $tuple (@result) {
#     push @formatted, "('$tuple->[0]', $tuple->[1])";
# }
# print join(", ", @formatted);
# print "]\n";