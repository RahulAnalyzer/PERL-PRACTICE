use strict;
use warnings;
use XML::LibXML;


# my $parse = XML::LibXML->new;
# my $doc = $parse->parse_file('FILE HANDLING\TEXT\data.xml');

# for my $book($doc->findnodes('/library/book')){
#     my $id = $book->getAttribute('id');
#     my $title = $book->findvalue('./title');
#     my $author = $book->findvalue('./author');
#     my $price = $book->findvalue('./price');

#     print "$id | $title | $author | $price\n";
# }


sub parse_file{
    my($file) = @_;

    my $parse = XML::LibXML->new;
    my $doc = $parse->parse_file($file);

    for my $book ( $doc ->findnodes('/library/book')){
        
        my $id = $book->getAttribute('id');
        my $title = $book->findvalue('./title');
        my $author = $book->findvalue('./author');
        my $price = $book->findvalue('./price');

         print "$id | $title | $author | $price\n";

    }

}

parse_file("FILE HANDLING\\TEXT\\data.xml");