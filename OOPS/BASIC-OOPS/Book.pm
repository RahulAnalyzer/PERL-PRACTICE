package Book;
use strict;
use warnings;

sub new{
    my ($class , $title , $author) = @_;

    my $self = {
        title => $title,
        author => $author,
    };
    
    bless $self , $class;
    return $self;

}

sub get_title {
    my ($self) = @_;
    return $self->{title};
}

sub get_author{
    my ($self) = @_;
    return $self->{author};
}
1;