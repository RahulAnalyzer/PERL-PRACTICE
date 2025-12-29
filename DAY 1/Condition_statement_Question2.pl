# Problem 1: Multi-Stage Transaction Validator
use strict;
use warnings;


my @transactions = (
    { id => 101, amount => 5000, region => "EU", verified => 1 },
    { id => 102, amount => 12000, region => "ASIA", verified => 0 },
);

my ($accepted, $rejected, $flagged) = (0, 0, 0);

foreach my $t (@transactions) {
    if (!$t->{verified}) {
        print "Transaction $t->{id} rejected: Verification failed\n";
        $rejected++;
    } else {
        $accepted++;
    }
}

print "Accepted: $accepted | Rejected: $rejected | Flagged: $flagged\n";
