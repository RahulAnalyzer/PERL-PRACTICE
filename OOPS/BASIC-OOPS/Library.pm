package Library;
use strict;
use warnings;

sub new {
    my ($class , $book ) = @_;
    my $self = {
        book => [], #array reference;
    };
    bless $self , $class;
    return $self;
}

sub add_book{
    my ($self , $title , $author) = @_;
    push @{$self->{book}} ,{
        title => $title,
        author => $author,
    };
}

sub list_book{
    my ($self) = @_;
    print "\n---- BOOKS DETAILS ARE ----\n";
    foreach my $book(@{$self->{book}}){

        print "TITLE: $book->{title}\n";
        print "AUTHOR: $book->{author}\n";

        print "x" x 30 , "\n";
    };
    
}
1;