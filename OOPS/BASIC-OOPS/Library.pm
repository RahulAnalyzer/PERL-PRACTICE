package Library;
use strict;
use warnings;
use Book;

sub new {
    my ($class , $book ) = @_;

    my $self = {
        book => [], #array reference;
    };
    bless $self , $class;
    return $self;
}

sub add_book{
    
    my ($self , $book_obj ) = @_;
    push @{$self->{books}} , $book_obj;
}

sub list_book{
    my ($self) = @_;
    print "\n---- BOOKS DETAILS ARE ----\n";


    foreach my $book(@{$self->{books} }){

        print "Title : " . $book->get_title() . "\n";
        print "Author : " . $book->get_author() . "\n";
        print "-" x 30, "\n";
    };
    
}
1;