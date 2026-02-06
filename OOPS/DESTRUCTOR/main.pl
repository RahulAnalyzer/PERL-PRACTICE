use strict;
use warnings;
use lib "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/DESTRUCTOR";
use Filehandler;

my $obj = Filehandler->new("text.txt");
$obj->write("HELLO PERL");
undef $obj; # object destroyed here;

=begin
Why This is Powerful
even if
- program crashes
- function exits early
- exception occurs

Perl Still Calls DESTROY (if)
=end
=cut