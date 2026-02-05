package Animal;
use strict;
use warnings;

sub new{
    my ($class) = @_;
    my $self = {};
    bless $self , $class;
    return $self;
}

sub make_sound{
    die "Must Sound() must be implemented by child class\n";
}
1;
