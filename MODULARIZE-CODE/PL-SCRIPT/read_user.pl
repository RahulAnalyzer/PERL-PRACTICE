use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";

use My::csvutils qw(read_csv);

my $file = "$Bin/../DATA/user.csv";

my @users = read_csv($file);

for my $u(@users){
    print "$u->{name}, $u->{name} , $u->{email}\n";
}