use strict;
use warnings;
BEGIN {
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\ENCAPSULATION';
};
use student;

my $stu = student->new("Rahul" , 91154 , "UG");
$stu->set_marks(75);

print "Name : " . $stu->get_name() . "\n";
print "Roll No : " . $stu->get_roll_no() . "\n";
print "Student Standard : " . $stu->get_standard() . "\n";
print "Marks : " . $stu->get_marks() . "\n";