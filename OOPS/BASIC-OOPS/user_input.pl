use strict;
use warnings;
use Data::Dumper;

BEGIN {
    push @INC, 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/BASIC-OOPS';
}

use Student;

my @students;

print "How many students? \n";
chomp(my $count = <STDIN>);
for (my $i = 1; $i <= $count; $i++){
    
    print "\nStudent $i\n";

    print "Enter name: ";
    chomp(my $name = <STDIN>);

    print "Enter Roll no: ";
    chomp(my $roll_no = <STDIN>);

    print "Enter a Subject: ";
    chomp(my $subject = <STDIN>);

    print "Enter Marks: ";
    chomp(my $marks = <STDIN>);

    print "-" x 40 ,"\n";

    my $student = Student->new($name , $roll_no , $subject , $marks);
    push @students , $student;
}

print "\n------- Student Details -----\n";
foreach my $stu (@students)
{
    $stu->get_details();
    if ($stu->is_passed()){
        print "Status: PASS\n";
    }else{
        print "Status: FAIL\n";
    }
     print "-" x 30 ,"\n";
}
print "\n";

# print "STUDENT DETAIL IN KEY VALUE\n";
# foreach my $stu (@students) {
#     print Dumper($stu);
# }