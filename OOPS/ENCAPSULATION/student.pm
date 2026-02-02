package student;
use strict;
use warnings;

sub new{
    my ($class , $name , $roll_no , $standard) = @_;
    my $self = {
        name => $name,
        roll_no => $roll_no,
        standard => $standard,
        marks => 0,
    };
    bless $self , $class;
    return $self;
}


#getter 

sub get_name{
    my ($self) = @_;
    return $self->{name};
}

sub get_roll_no{
    my ($self) = @_;
    return $self->{roll_no};
}

sub get_standard{
    my ($self) = @_;
    return $self->{standard};
}

sub get_marks{
    my ($self) = @_;
    return $self->{marks};
}

# setter 
sub set_marks{
    my ($self , $marks) = @_;
    
    die "Invalid Marks\n" if $marks < 0 || $marks > 100;
    $self->{marks} = $marks;

}
1;

