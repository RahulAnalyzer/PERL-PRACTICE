use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(

    LocalAddr => '127.0.0.1',
    LocalPort => 6666,
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1,
) or die "Cannot Create Socket:$!\n";
print "Server Waiting on Port 6666\n";

print "Waiting for Data from the client end\n";
my $new_socket = $socket->accept();
while(<$new_socket>){
    print $_;
}
close($new_socket);



# my $server = IO::Socket::INET->new(  # create a listening socket This mean I am claiming port 5000 on this machine 
#     LocalAddr => '127.0.0.1',
#     LocalPort => 5000,
#     Proto => 'tcp',
#     Listen => 1, # “I will allow 1 connection at a time”
#     Reuse => 1, # allows the socket to be quickly reused after closure, enabling the server to restart without waiting for the socket to fully close, which helps prevent "Address already in use" errors.
# ) or die "Server Creation Failed;$!";
# print "Server is waiting on port 5000....\n";

# my $client = $server->accept(); # This line does nothing , waits , Freeze the program until a client connects
# my $message = <$client>; # this line waits until 1) Client sends data 2) OR client closes connection 
# chomp $message;

# print "Received from Client: $message\n";
# print $client "Hello Client, I got your message\n";

# close $client;
# close $server;






















