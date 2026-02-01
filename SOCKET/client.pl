use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(

    PeerAddr => '127.0.0.1',
    PeerPort => 6666,
    proto => 'tcp',
)or die "Could not create socket: $!\n";

print "Enter the Data to send\n";
my $data = <STDIN>;
chomp $data;
print $socket "Data Received From User: '$data'\n";

close ($socket);














# my $socket = IO::Socket::INET->new(
#     PeerAddr => '127.0.0.1',
#     PeerPort => 5000,
#     Proto => 'tcp',
# ) or die "Connection Failed: $!";

# print $socket "Hello server\n";

# my $reply = <$socket>;
# print "Server replied: $reply";
# close $socket;



