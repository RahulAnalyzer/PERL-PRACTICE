use strict;
use warnings;

print "Enter a File Name: ";
my $file = <STDIN>;
chomp $file;

print "Enter a Content: ";
my $content = <STDIN>;

#--------- SUBROUTINES/FUNCTIONS ----------

sub create_file{

    my($file_path) = @_;

    open my $fh, '>', $file_path or die "Cannot Create file: $!";
    close $fh;
    print "File is Created: $file_path\n";

}

sub write_file{
    my ($file_path, $content) = @_;
    
    open my $fh, ">", $file_path or die "Cannot Write in this File: $!";

    print $fh $content;
    close $fh;
    print "Content is written in the File\n";
}

sub read_file{
    my($file_path) = @_;

    open my $fh, "<", $file_path or die "Cannot Read File sorry:$!";
    print "Reading the file Content\n";
    while(my $line = <$fh>){
        print $line;
    }
    close $fh;
    print "\n";
}


#-------- MAIN ---------
create_file($file);
write_file($file, $content);
read_file($file);