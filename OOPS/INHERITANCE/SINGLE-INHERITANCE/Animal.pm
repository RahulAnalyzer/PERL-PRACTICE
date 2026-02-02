package Animal;
use strict;
use warnings;


sub new{
    my ($class , $name) = @_;
    my $self ={
        name => $name,
    };
    bless $self , $class;
    return $self;
}

sub eat {
    my ($self) = @_;
    return "$self->{name} is a Eating\n";
}

1;

