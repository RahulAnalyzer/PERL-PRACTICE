# phone number validate checker

print "ENTER THE NUMBER: ";

chomp(my $number =<STDIN>);
if(is_valid_phone($number)){
    print "PHONE NUMBER IS VALID\n";
}else{
    print "INVALID PHONE NUMBER\n";
}

sub is_valid_phone{
    my ($number) = @_;
    return $number =~ /^\+?[1-9]\d{0,2}[\s-]?[1,9]\d{6,14}$/g;
}