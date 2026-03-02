use strict;
use warnings;
use IO::Select;
use IO::Socket::INET;
use Fcntl qw(F_SETFL O_NONBLOCK);

# Creating Server
my $server = IO::Socket::INET->new(
    LocalPort => 5000,
    Proto => 'tcp',
    Listen => 5,
    Reuse =>1
) or die "Cannot Create Server:$!\n";

my $select = IO::Select->new();
$select->add($server);

# Data Structures
my %clients; # client_id => socket
my %write_buffer;  # client_id => pending outgoing date

# Event LOOP

while(1){
   my @readable = $select->can_read(1); # it will wait up to 1 second and tell me which sockets are ready for reading.
   my @writeable = $select->can_write(0);


   # READABLE SOCKETS

   foreach my $sock(@readable){
    if($sock == $server){
        my $client = $server->accpet();
        next unless $client;

        fcntl($client , F_SETFL , O_NONBLOCK);

        my $id = fileno($client);
        $clients{$id} = $client;
        $select->add($client);

        print "Client Connected: $id\n";
    }

    # Exisiting Client Sent Data
    else{
        my $id = fileno($sock);
        my $buffer = '';

        my $bytes = sysread($sock, $buffer , 1024);
        if( defined $bytes && $bytes > 0){
            print "Received From $id: $buffer";

            # Add Response to write buffer
            $write_buffer{$id} .= "Echo: $buffer";
        }
        else{
            cleanup($sock);
        }
    }
   }


   # Writeable Socket

   foreach my $sock(@writeable){
    my $id = fileno($sock);
    next unless exists $write_buffer{$id};
    next unless length $write_buffer{$id};

    my $bytes = syswrite($sock , $write_buffer{$id});

    if(defined $bytes){

        #remove sent portion
        substr($write_buffer{$id}, 0 , $bytes, '');

        #if buffer empty , delete it
        delete $write_buffer{$id}
        unless length $write_buffer{$id};
    }else{
        cleanup($sock);
    }
   }

}
# Cleanup function 

   sub cleanup{
    my ($sock) = @_;
    return unless $sock;

    my $id = fileno($sock);
    delete $clients{$id};
    delete $write_buffer{$id};

    close $sock;
   }
