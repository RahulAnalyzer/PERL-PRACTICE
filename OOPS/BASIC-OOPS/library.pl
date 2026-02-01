use strict;
use warnings;
BEGIN {
    push @INC , 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/BASIC-OOPS';
}
use Library;

my $library = Library->new();

print "How many Book? ";
chomp(my $count = <STDIN>);

for(1 .. $count){
   

    print "Enter Book title: ";
    chomp(my $title = <STDIN>);

    print "Enter Book Author: ";
    chomp(my $author = <STDIN>);

    

    $library->add_book($title , $author);
}

$library->list_book();