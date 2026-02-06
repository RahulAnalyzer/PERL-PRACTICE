package Filehandler;
use strict;
use warnings;


sub new{
    my ($class, $file) = @_;
    open my $fh , '>' , $file or die $!;
    my $self = {
        fh => $fh
    };
    bless $self , $class;
    return $self;
}

sub write{
    my ($self , $text) = @_;
    my $fh = $self->{fh};
    print $fh "$text\n";
}

sub DESTROY{
    my ($self) = @_;
    close $self->{fh};
    print "File is Closed Automatically\n";
}
1;


use Filehandler;
my $obj = Filehandler->new("text.txt");
$obj->write("Hello Perl");
undef $obj; # object destroy here