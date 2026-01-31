use strict;
use warnings;
use Data::Dumper;
BEGIN{
    push @INC, 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS';
};
use Student;


my $stu1 = Student->new("Rahul", 35 , "Math" , 21);
my $stu2 = Student->new("Sehaj" , 34 , "English" , 99);
$stu1->get_details();
$stu2->get_details();
print "Student 1 is : ", $stu1->is_passed ? "passed\n" : "Failed\n";
print Dumper($stu1 , $stu2);
