package Student;
use strict;
use warnings;

sub new { # New (Constructor (new method )) A contructor Create Data , Blesses it , return the object. Convention its called new
    
    my ($class , $name , $roll_no , $subject, $marks) = @_;
    
    my $self = {
        name => $name,
        roll_no => $roll_no,
        subject => $subject,
        marks => $marks,
    };

    bless $self, $class; # bless tell perl:- Treat This reference as an object of this package

    return $self;
}
sub get_details{
    my($self) = @_;

    print "Name: $self->{name} \n"; 
    print "Roll: $self->{roll_no}\n";
    print "Subject: $self->{subject}\n"; 
    print "Marks: $self->{marks}\n";
}

sub is_passed{
    my($self) = @_;
    return $self->{marks} >= 40;
    
}
1;