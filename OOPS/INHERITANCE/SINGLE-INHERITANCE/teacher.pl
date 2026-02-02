use strict;
use warnings;

BEGIN{
    push @INC , 'C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\OOPS\INHERITANCE\SINGLE-INHERITANCE';
};

use teacher;

my $teacher1 = teacher->new("RAM KUMAR" , "ENGLISH");
print $teacher1->get_name() ."\n";
print $teacher1->get_subject();