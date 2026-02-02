package dog;
use strict;
use warnings;
use parent 'Animal';


sub bark{
    my ($self) = @_;
    return "$self->{name} is barking\n";
}

1;
