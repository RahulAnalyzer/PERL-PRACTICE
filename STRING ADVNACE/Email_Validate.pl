<<<<<<< HEAD
use strict;
use warnings;




print "Enter the email here: ";
my $email = <STDIN>;
chomp($email);
if(valid_email($email)){
    print "VALID EMAIL ADDRESS\n";
}
else{
    print "NOT VALID ADDRESS\n";
}

sub valid_email{
    my ($email) = @_;
    # return $email =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z0-9]{2,}$/;
    return $email =~ /^[A-Za-z0-9][A-Za-z0-9._%+-]*[A-Za-z0-9]@[A-Za-z0-9-]+\.[A-Za-z]{2,}$/;
}
    


=======
use strict;
use warnings;




print "Enter the email here: ";
my $email = <STDIN>;
chomp($email);
if(valid_email($email)){
    print "VALID EMAIL ADDRESS\n";
}
else{
    print "NOT VALID ADDRESS\n";
}

sub valid_email{
    my ($email) = @_;
    # return $email =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z0-9]{2,}$/;
    return $email =~ /^[A-Za-z0-9][A-Za-z0-9._%+-]*[A-Za-z0-9]@[A-Za-z0-9-]+\.[A-Za-z]{2,}$/;
}
    


>>>>>>> master
