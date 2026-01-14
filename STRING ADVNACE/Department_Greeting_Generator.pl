<<<<<<< HEAD

sub HR{
    
    my ($name , $department) = @_;
    $name =~ s/^\s+|\s+$//g;
    $department =~ s/^\s+|\s+$//g;
    
    
    $name = ucfirst(lc($name));
    $department = ucfirst(lc($department));
    return "Welcome $name to the $department Department!\n";
    
}

print "Name: ";
chomp(my $n = <STDIN>);
print "Department: ";
chomp(my $dep = <STDIN>);

my $result = HR($n,$dep);
print $result;
=======

sub HR{
    
    my ($name , $department) = @_;
    $name =~ s/^\s+|\s+$//g;
    $department =~ s/^\s+|\s+$//g;
    
    
    $name = ucfirst(lc($name));
    $department = ucfirst(lc($department));
    return "Welcome $name to the $department Department!\n";
    
}

print "Name: ";
chomp(my $n = <STDIN>);
print "Department: ";
chomp(my $dep = <STDIN>);

my $result = HR($n,$dep);
print $result;

my $my_File = "Today we are going to "
>>>>>>> master
