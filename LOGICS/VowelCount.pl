# FIND THE COUNT OF VOWEL AND CONSONANT COUNT FROM STRING

use strict;
use warnings;

my @names = ("rahul" , "saket" , "mokesh");

foreach my $word(@names){
    my $vowel_count = 0;
    my $consonant_count = 0;

    my @chars = split //, $word;

    foreach my $ch(@chars){
        
        if ($ch =~ /[aeiouAEIOU]/){
            $vowel_count++;
        }
        elsif($ch =~ /[a-zA-Z]/){
            $consonant_count++;
        }
    }
    print "Name: $word | Vowels: $vowel_count | Consonants: $consonant_count\n";
}

print "\n";

# COUNT THE OCCURANCE OF THE NAMES:

print "Enter a name: ";
chomp(my $name = <STDIN>);

my %vowel_count;

foreach my $ch (split //, $name) {

    if ($ch =~ /[aeiouAEIOU]/) {
        $ch = lc($ch); 
        $vowel_count{$ch}++;
    }
}

foreach my $vowel (sort keys %vowel_count) {
    print "$vowel => $vowel_count{$vowel}\n";
}

print "\n";


# print "Enter a name: ";
# chomp(my $name = <STDIN>);

# my $vowels = 0;
# my $consonants = 0;

# my @chars = split //, $name;

# foreach my $ch (@chars) {
#     if ($ch =~ /[aeiouAEIOU]/) {
#         $vowels++;
#     }
#     elsif ($ch =~ /[a-zA-Z]/) {
#         $consonants++;
#     }
# }

# print "Name: $name | Vowels: $vowels | Consonants: $consonants\n";


# REVERSE THE STRING

print "Enter a string: ";
chomp(my $str = <STDIN>);

my $reversed = "";

my @chars = split //, $str;

for (my $i = $#chars; $i >= 0; $i--) {
    $reversed .= $chars[$i];
}

print "Reversed string: $reversed\n";


# my $rah = "RAHUL";
# my @spl = split //, $rah;
# print "@spl\n";

print "\n";

# another approach to reverse the string without changing the locations

print "Enter a sentence: ";
chomp(my $input = <STDIN>);

my @words = split /\s+/, $input;
my @result;

foreach my $word (@words) {
    {
        $rev_word .= $chars[$i];
    }

    push @result, $rev_word;
}

my $final = join " ", @result;
print "Output: $final\n";



# STRING PALINDROM 
my $string = "RAR";
if($string eq reverse $string){
    print "THIS IS PALINDROM\n";
}
else{
    print "THIS IS NOT PALINDROM\n";
}

print "\n";

# count the String occurance
# given string = abbbbccxyy 
#output should be a1b4c2x1y2

# my $str = "abbbbccxyy";

# my %count;
# for my $ch (split //, $str) {
#     $count{$ch}++;
# }

# my %printed;
# for my $ch (split //, $str) {
#     if (!exists $printed{$ch}) {
#         print $ch . $count{$ch};
#         $printed{$ch} = 1;
#     }
# }


use strict;
use warnings;

my $word = "nurses run";

$word =~ s/[^a-zA-Z0-9]//g; 
$word = lc($word);


my $is_palindrom = 1;

for(my $i = 0; $i < length($word)/2; $i++){
    my $left = substr($word, $i, 1);
    my $right = substr($word, length($word)-$i-1,1);
    
    if($left ne $right){
        $is_palindrom = 0;
        last;
    }
}

if ($is_palindrom){
    print "The word '$word' is a palindrom\n";
    
}else{
    print "The word '$word' is not a palindrom\n";
}

my @array_string = ("RADAR")