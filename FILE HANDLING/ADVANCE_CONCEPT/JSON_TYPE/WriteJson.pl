use strict;
use warnings;
use FindBin qw($Bin);
use JSON;

#Existing Folder
my $folder = "$Bin/../../TEXT";
my $file_name = "simple.json";

my $file_path ="$folder/$file_name";

sub write_json_file{
    my ($path, $data) = @_;
    open my $fh, '>', $path or die "Cannot Open Files: $!";
    print $fh to_json($data,{pretty => 1});
    close $fh;

}

#------- MAIN ---------
my $user ={
    name => "Rahul",
    age => 22,
    role => "Student",
};
write_json_file($file_path, $user);
print "JSON File Written\n";