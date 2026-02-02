# In The Single Inheritance There Is only One Parent and One Child
# Student is a Person

package SingleInheritance;
use strict;
use warnings;

sub new{
    my ($class , $name) = @_;
    my $self = {
        name => $name,
    };
    bless $self , $class;
    return $self;
}

sub get_name {
    my ($self) = @_;
    return $self->{name};
}
1;

