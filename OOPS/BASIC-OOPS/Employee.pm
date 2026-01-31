package Employee;
use strict;
use warnings;

sub new {
    my ($class , $id , $name , $salary) = @_;

    my $self = {
        id => $id,
        name => $name,
        salary => $salary,
    };

    bless $self , $class;
    return $self;
}

# methods: increment(percent) get_details()
sub get_salary{
    my ($self) = @_;
    print "Current Salary: $self->{salary}\n";
}
sub salary_increament{
    my ($self, $increment) = @_;
    if ($increment > 0) {
        $self->{salary} += ($self->{salary} * $increment / 100);
        print "Salary increment by 10 % \n";
    }else{
        print "Invalid Percentage\n";
    }
}

sub get_details{
    my ($self) = @_;
    print "Id:  $self->{id}\n";
    print "Name:  $self->{name}\n";
    print "Salary: $self->{salary}\n";
}
1;