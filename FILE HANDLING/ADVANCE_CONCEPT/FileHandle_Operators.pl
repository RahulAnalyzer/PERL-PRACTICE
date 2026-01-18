use strict;
use warnings;

#--- -e EXISTS ----

my $path = "FILE HANDLING/TEXT/Example.txt";

if (-e $path){
    print "Path exists\n";
}else{
    print "Path Does not exist\n";
}
print "\n";

#------ -f Regular File ----

if(-f $path){
    print "It is Regular File\n";
}else{
    print "Not a Regular File\n";
}
print "\n";

#---- d Is a Directory -----
my $dir = "FILE HANDLING/TEXT";
if (-d $dir){
    print "It is Directory\n";
}else{
    print "It is not a directory\n";
}
print "\n";

#---- -r Readable File ------

if (-r $path){
    print "File is Readable\n";
}else{
    print "File is not Readable\n";
}
print "\n";

#------ w Writable ------
if(-w $path){
    print "File is Writeable\n";

}else{
    print "File is not Writeable\n";
}
print "\n";

#------ -x Executable -------

my $file = 'FILE HANDLINE/fileOpen.pl';

if(-x $file){
    print "This File is Executable\n";
}else{
    print "This File is Not Executable\n";
}
print "\n";

#------- -s SIZE OF FILE --------
my $file = "FILE HANDLINE/TEXT/TESTING FILE.txt";

my $size = -s $file;

if ($size) {
    print "File size: $size bytes\n";
} else {
    print "File is empty or does not exist\n";
}