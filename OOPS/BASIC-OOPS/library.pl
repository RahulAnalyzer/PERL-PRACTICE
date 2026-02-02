use strict;
use warnings;
BEGIN {
    push @INC , 'C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/OOPS/BASIC-OOPS';
}
use Library;
use Book;

my $library = Library->new();

print "How many Book? ";
chomp(my $count = <STDIN>);

for(1 .. $count){
   

    print "Enter Book title: ";
    chomp(my $title = <STDIN>);

    print "Enter Book Author: ";
    chomp(my $author = <STDIN>);

    

    my $book = Book->new($title , $author);
    $library->add_book($book);
}

$library->list_book();