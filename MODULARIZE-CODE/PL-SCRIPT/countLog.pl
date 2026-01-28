use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";

use My::logUtils qw(Count_keywords);

my $log_file = "$Bin/../DATA/app.log";

my %result = Count_keywords($log_file, qw(INFO WARN ERROR INFO));

print "INFO: $result{INFO}\n";
print "WARN: $result{WARN}\n";
print "INFO: $result{INFO}\n";
