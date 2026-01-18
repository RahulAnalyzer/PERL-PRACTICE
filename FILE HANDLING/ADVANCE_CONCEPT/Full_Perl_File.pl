use strict;
use warnings;

#---------- SUBROTINES ------------

sub create_file{
    my ($file_path) = @_;
    
    open my $fh ,">", $file_path
    or die "Cannot Create File: $!";

    close $fh;
    print "File Created: $file_path\n";

}

sub write_file{
    my ($file_path, $content) = @_;

    open my $fh ,">" , $file_path
    or die "Cannot Open File For Writing: $!";

    print $fh $content;
    close $fh;
    print "DATA WRITTEN TO FILE\n";
}

sub read_file{
    my($file_path) = @_;
    

    open my $fh ,"<" , $file_path
    or die "Cannot Read File: $!";

    print "Reading File Content:\n";
    while(my $line = <$fh>){
        print $line;
    }
    close $fh;
    print "\n";
}

sub append_file{
    my ($file_path, $content) = @_;

    open my $fh ,">>" , $file_path 
    or die "Cannot Oepn this File For Append;$!";

    print $fh $content;
    close $fh;
    print "Successfully Append on this file\n";
}

# sub delete_file{
#     my ($file_path) = @_;
#     unlink $file_path or die "Cannot Delete File: $!";

#     print "File Deleted: $file_path\n";
# }

my $file = 'Example.txt';

#--------- Main ----------

create_file($file);
write_file($file, "THIS IS THE FIRST LINE OF THE TEXT\n");
read_file($file);

append_file($file, "THIS IS THE APPENEDENE LINE\n");
read_file($file);
# delete_file($file);