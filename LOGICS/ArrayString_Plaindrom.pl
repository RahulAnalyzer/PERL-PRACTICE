<<<<<<< HEAD
my @strings = ('RADAR', 'RAT', 'MADAM');

for (my $i = 0; $i < @strings; $i++) {
    my $str = $strings[$i];
    my $len = length($str);
    my $is_palindrome = 1;
    for (my $j = 0; $j < $len / 2; $j++) {
        my $left_char = substr($str, $j, 1);
        my $right_char = substr($str, $len - 1 - $j, 1);
        if (lc($left_char) ne lc($right_char)) {
            $is_palindrome = 0;
            last;
        }
    }
    if ($is_palindrome) {
        print "$str is a palindrome.\n";
    } else {
        print "$str is not a palindrome.\n";
    }
}

=======
my @strings = ('RADAR', 'RAT', 'MADAM');

for (my $i = 0; $i < @strings; $i++) {
    my $str = $strings[$i];
    my $len = length($str);
    my $is_palindrome = 1;
    for (my $j = 0; $j < $len / 2; $j++) {
        my $left_char = substr($str, $j, 1);
        my $right_char = substr($str, $len - 1 - $j, 1);
        if (lc($left_char) ne lc($right_char)) {
            $is_palindrome = 0;
            last;
        }
    }
    if ($is_palindrome) {
        print "$str is a palindrome.\n";
    } else {
        print "$str is not a palindrome.\n";
    }
}

>>>>>>> master
