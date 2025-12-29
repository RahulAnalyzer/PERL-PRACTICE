use strict;
use warnings;

my %keypad = (
    2 => "abc",
    3 => "def",
    4 => "ghi",
    5 => "jkl",
    6 => "mno",
    7 => "pqrs",
    8 => "tuv",
    9 => "wxyz",
);

print "Enter a Word: ";
chomp(my $word = <STDIN>);
$word = lc $word;

for my $ch (split //, $word){
    next if $ch eq ' ';

    for my $key (keys %keypad){
        my $pos = index($keypad{$key}, $ch);

        if($pos != -1){
            print "$ch => key $key pressed ", $pos + 1, " times\n";
            last;
        }
    }
}

print "\n";
# count the String occurance
# given string = abbbbccxyy 
#output should be a1b4c2x1y2

my $str = "abbbbccxyy";

my %count;
for my $ch (split //, $str) {
    $count{$ch}++;
}

my %printed;
for my $ch (split //, $str) {
    if (!exists $printed{$ch}) {
        print $ch . $count{$ch};
        $printed{$ch} = 1;
    }
}
print "\n";


























