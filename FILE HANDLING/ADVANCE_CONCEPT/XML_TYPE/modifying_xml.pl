use strict;
use warnings;
use XML::LibXML;

use strict;
use warnings;
use XML::LibXML;

main();

sub main {

    my $input_file  = "FILE HANDLING/TEXT/data.xml";
    my $output_file = "Update_data.xml";

    my $doc = load_xml($input_file);

    update_price($doc, '101', '349');
    add_book_category($doc, '101', 'programming');
    add_new_book($doc, '102', 'Advance Perl', 'Larry', '459');
    # remove_book($doc, '999');

    write_xml($doc, $output_file);
}

# ------------------------------------------------------------
# Load XML File
# ------------------------------------------------------------
sub load_xml {

    my ($file) = @_;

    my $parser = XML::LibXML->new;
    my $doc    = $parser->parse_file($file);

    return $doc;
}

# ------------------------------------------------------------
# Update Book Price
# ------------------------------------------------------------
sub update_price {

    # ❌ MISTAKE (Your Code):
    # my($doc , $book_id ,$new_price );
    #
    # This only declares variables but DOES NOT receive arguments.
    #
    # ✅ FIX:
    my ($doc, $book_id, $new_price) = @_;

    for my $price (
        $doc->findnodes("/library/book[\@id='$book_id']/price")
    ) {

        # ❌ MISTAKE (Your Code):
        # $price->removeChildNode();
        #
        # removeChildNode() does NOT exist in XML::LibXML.
        #
        # ✅ FIX: remove all child text nodes properly
        $price->removeChildNodes();

        # ✅ Add new price text
        $price->appendText($new_price);
    }
}

# ------------------------------------------------------------
# Add Category Attribute to Book
# ------------------------------------------------------------
sub add_book_category {

    my ($doc, $book_id, $category) = @_;

    for my $book (
        $doc->findnodes("/library/book[\@id='$book_id']")
    ) {

        # ✅ Correct attribute setting
        $book->setAttribute(category => $category);
    }
}

# ------------------------------------------------------------
# Add New Book Node
# ------------------------------------------------------------
sub add_new_book {

    my ($doc, $id, $title_text, $author_text, $price_text) = @_;

    my $root = $doc->documentElement();

    my $book = XML::LibXML::Element->new("book");
    $book->setAttribute(id => $id);

    my $title = XML::LibXML::Element->new("title");
    $title->appendText($title_text);

    # ❌ MISTAKE (Your Code):
    # my $author = XML::libXML::Element->new('author');
    #
    # Perl is case-sensitive.
    # XML::libXML is WRONG.
    #
    # ✅ FIX:
    my $author = XML::LibXML::Element->new("author");
    $author->appendText($author_text);

    # ❌ MISTAKE (Your Code):
    # my $price = XML::libXML::Element->new('price');
    #
    # Again, wrong casing.
    #
    # ✅ FIX:
    my $price = XML::LibXML::Element->new("price");
    $price->appendText($price_text);

    # ✅ Append child nodes correctly
    $book->appendChild($title);
    $book->appendChild($author);
    $book->appendChild($price);

    $root->appendChild($book);
}

# ------------------------------------------------------------
# Remove Book by ID
# ------------------------------------------------------------
# sub remove_book {

#     my ($doc, $book_id) = @_;

#     # ❌ MISTAKE (Your Code):
#     # "/library/book[\@id='$book_id]"
#     #
#     # Missing closing quote inside XPath.
#     #
#     # ✅ FIX:
#     for my $book (
#         $doc->findnodes("/library/book[\@id='$book_id']")
#     ) {

#         # ✅ Correct removal
#         $book->parentNode->removeChild($book);
#     }
# }

# ------------------------------------------------------------
# Write Updated XML to File
# ------------------------------------------------------------
sub write_xml {

    my ($doc, $file) = @_;

    open(my $fh, ">", $file)
        or die "Cannot write XML file: $!";

    print $fh $doc->toString(1);

    close($fh);
}
