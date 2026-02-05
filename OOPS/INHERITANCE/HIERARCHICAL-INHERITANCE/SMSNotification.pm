package SMSNotification;
use strict;
use warnings;

use parent 'Notification';

sub send{
    my($self) = @_;
    return "Sending SMS To " . $self->{recipient} . " With Message: " . $self->{message};
}

1;