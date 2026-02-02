BEGIN{
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\SINGLE-INHERITANCE';
}
use Student;
my $stu = Student->new("Rahul" , 35);
print $stu->get_name();
print $stu->get_roll_no();