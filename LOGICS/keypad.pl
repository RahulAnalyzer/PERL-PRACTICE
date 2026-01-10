# # use strict;
# # use warnings;

# # my %keypad = (
# #     2 => "abc",
# #     3 => "def",
# #     4 => "ghi",
# #     5 => "jkl",
# #     6 => "mno",
# #     7 => "pqrs",
# #     8 => "tuv",
# #     9 => "wxyz",
# # );

# # print "Enter a Word: ";
# # chomp(my $word = <STDIN>);
# # $word = lc $word;

# # for my $ch (split //, $word){
# #     next if $ch eq ' ';

# #     for my $key (keys %keypad){
# #         my $pos = index($keypad{$key}, $ch);

# #         if($pos != -1){
# #             print "$ch => key $key pressed ", $pos + 1, " times\n";
# #             last;
# #         }
# #     }
# # }

# # print "\n";


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

my @sequence;  

print "\n=== Detailed Breakdown ===\n";
for my $ch (split //, $word) {
    next if $ch eq ' ';  
    
    for my $key (keys %keypad) {
        my $pos = index($keypad{$key}, $ch);
        
        if ($pos != -1) {
            
            push @sequence, $key x ($pos + 1);
            
           
            print "$ch => key $key pressed ", $pos + 1, " times\n";
            last;
        }
    }
}

print "\n=== Key Sequence ===\n";
print join(" ", @sequence), "\n";


# my $str1 = "MADAM";

# my $is_plaindrom = 1;

# for( my $i = 0; $i < $len / 2; $i++ ){
#     if(substr($str1,$i,2))

# }







# my @a = ("name", "age", "city");
# my @b = (
#     ["rahul", 25, "punjab"],
#     ["raghav", 21, "mohali"]
# );

# my @result;
# foreach my $sub (@b) {
#     my %hash;
#     @hash{@a} = @$sub;
#     push @result, \%hash;
# }

# use Data::Dumper;
# print Dumper(\@result);

















