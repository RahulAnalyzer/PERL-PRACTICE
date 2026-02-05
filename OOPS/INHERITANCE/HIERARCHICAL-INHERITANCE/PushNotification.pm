package PushNotification;
use strict;
use warnings;
use parent 'Notification';

sub send{
    my($self) = @_;


    return "Sending PUSH Notification to device " . $self->{recipient} . " With Message: " . $self->{message};

}
1;