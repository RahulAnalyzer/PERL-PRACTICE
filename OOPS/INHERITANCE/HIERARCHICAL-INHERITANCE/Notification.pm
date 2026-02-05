package Notification;
use strict;
use warnings;

sub new{
    my ($class , $message , $recipient) = @_;
    my $self = {
        message => $message,
        recipient => $recipient,
    };
    bless $self , $class;
    return $self;
}

sub get_message {
    my ($self) = @_;
    return $self->{message};
}

sub get_recipient{
    my ($self) = @_;
    return $self->{recipient};
}

sub send{
    die "Send() must be implement by child class\n";
}

1;