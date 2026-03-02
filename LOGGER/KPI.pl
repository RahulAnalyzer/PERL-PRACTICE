#!/usr/bin/perl
use strict;
use warnings;

# Our events — stored with the time they arrived
my @events = (
    { source => 'Router-A', time => 1000 },    # arrived at time 1000
    { source => 'Server-B', time => 1015 },    # arrived 15 seconds later
    { source => 'Server-C', time => 1045 },    # arrived 45 seconds later
    { source => 'Printer',  time => 1500 },    # arrived 500 seconds later
);

my $window = 60;    # we only care about events within 60 seconds of each other

# Pick a reference time — let's say we're checking from time 1000
my $reference_time = 1000;

print "=== Events within $window seconds of time $reference_time ===\n\n";

for my $event (@events) {

    # How many seconds after the reference time did this arrive?
    my $seconds_apart = $event->{time} - $reference_time;

    if ($seconds_apart <= $window) {
        print "$event->{source} arrived $seconds_apart seconds later → WITHIN window ✓\n";
    } else {
        print "$event->{source} arrived $seconds_apart seconds later → OUTSIDE window ✗\n";
    }
}


