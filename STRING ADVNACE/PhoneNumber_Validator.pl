<<<<<<< HEAD
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
=======
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



# another problem 
sub valid_palindrome {
    my ($s) = @_;
    my @chars = split //, $s;
    my ($left, $right) = (0, $#chars);

    while ($left < $right) {
        if ($chars[$left] eq $chars[$right]) {
            $left++;
            $right--;
        } else {
            # Check if skipping left or right character makes it palindrome
            return is_palindrome(\@chars, $left + 1, $right) || is_palindrome(\@chars, $left, $right - 1);
        }
    }
    return 1;
}

sub is_palindrome {
    my ($arr_ref, $start, $end) = @_;
    while ($start < $end) {
        return 0 unless $arr_ref->[$start] eq $arr_ref->[$end];
        $start++;
        $end--;
    }
    return 1;
}

my $string = "abc";
print valid_palindrome($string) ? "Yes\n" : "No\n";
>>>>>>> master
