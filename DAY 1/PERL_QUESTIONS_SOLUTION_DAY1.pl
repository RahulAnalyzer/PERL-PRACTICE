# 1st Question 


use strict;
use warnings;

my $name = "RAHUL SINGH";
my $age = "21";
my $salary = "450000.75";

print "____STRING CONTTEXT_____\n";
print "name as string:"  ."".$name  ."\n";
print "age as string: "    . "".$age    . "\n";
print "salary as string: " . "".$salary . "\n";

print "\n---- NUMERIC CONTEXT ----\n";
print "name as number: "   . ($name + 0)   . "\n";
print "age as number: "    . ($age + 0)    . "\n";
print "salary as number: " . ($salary + 0) . "\n";


# 2nd question 

use strict;
use warnings;

print "ENTER THE TEMPERATURE IN CELSIUS: ";
chomp(my $input = <STDIN>);

if (!defined $input || $input eq '')
{
    die "Input rejected: empty value\n";
}

if ($input !~ /^-?\d+(?:\.\d+)?$/) {
    die "Input rejected: not a numeric value\n";
}

my $celsius = $input + 0;
my $fahrenheit = ($celsius * 9/5) + 32;

printf "Celsius: %.2f\n", $celsius;
printf "Fahrenheit: %.2f\n", $fahrenheit;


# 3rd question 

{"Rahul", "Saket", "Moksh"}
I am a student ---> I ma a tneduts
{"Ra hul", "Sak et", "Mo ksh"














use strict;
use warnings;

# my %student = (
#     name => "Rahul",
#     age  => 22
# );

# $student{course} = "MCA";
# print $student{name}, "\n";
# print $student{age}, "\n";
# print $student{course}, "\n";

# my @nums = (10,20,30,40,50);

# my @slice = @nums[1,3];
# print "@slice\n";

# splice(@nums , 2,0,77,88);
# print "@nums\n";



#unless statement 
# $x = 10;
# unless($x%2==0)
# {
#     print "X is odd\n";
# } else{
#     print "X is Even\n";
# }


# # array index loop
#  my @arr = (10,20,30);
#  my $i = 0;
#  while ($i < @arr){
#      print "$arr[$i]\n";
#      $i++;
#  }

# #until Loop 

# my $i =1;
# until ($i > 5){
#     print "$i\n";
#     $i++;
# }

# # array traversal using the until
# my @arr = (100,200,300);
# my $i = 0;
# until ($i == @arr){
#     print "$arr[$i]\n";
#     $i++;
# }

# # for loop ( C- style )
# for (my $i = 1; $i <= 10; $i++){
#     print "$i\n";
# }

# #reverse loop 
# for (my $i = 5; $i >= 1; $i--){
#     print "$i\n";
# }

# # array index loop 
# my @arr = (10,20,30,40,50);
# for (my $i = 0; $i < @arr; $i++){
#     print "arr[$i]\n";
# }


# # for each loop ( most using loop in perl )
# my @arr = ("Rahul","Sehaj","Raghav");
# foreach my $x (@arr){
#     print "$x\n";
# }

# #implicit variable $_
 
# # foreach (@arr){
# #     print "$_\n";
# # }

# # hash key 

# my %h = (a => 1, b => 2);
# foreach my $key (keys %h){
#     print "$key => $h{$key}\n";
# }

# # modify array Elements

# foreach my $x (@arr){
#     $x *= 2;
# }

# # do While loop
# #condition is checked after the loop runs so it runs at least once no matter what

# my $i = 1;

# do{
#     print "$i\n";
#     $i++;
# } while ($i <= 5);



# my $x = 0;
# do {
#     print "Runs once\n";
# } while ($x != 0);


# my @duplicate = (10,10,20,20,30,40,40,40,50,60,60);
# for (my $i = 0; $i < @array; $i++){
#     for (my $j = $i + 1; $j < @array; $j++){
#         print "$array[$i]\n" if $array[$i] eq $array[$j];
#     }
# }

# my @array = (10, 20, 20, 30, 40, 10);
# for (my $i = 0; $i < @array; $i++) {
#     for (my $j = $i + 1; $j < @array; $j++) {
#         print "$array[$i]\n" if $array[$i] == $array[$j];
#     }
# }

# print those number that are not duplicated
# print "NON DUPLICATE NUMBERS "
# my @array = (10, 20, 20, 30, 40, 10);
# my %count;

# # Count occurrences
# $count{$_}++ for @array;

# # Print numbers with count 1
# foreach my $num (@array) {
#     print "$num\n" if $count{$num} == 1;
# }


# prime number 

# print "Enter a Number: ";
# my $num = <STDIN>;
# chomp($num);

# if($num < 2 )
# {
#     print "$num is not a prime Number\n";
#     exit;
# }
# for(my $i = 2; $i * $i <= $num; $i++)
# {
#     if($num % $i == 0){
#     print "Number is not a Prime number\n";
#     exit;
# }
# }
# print "$num is Prime Number\n";


# GCD AND HCF
print "ENTER FIRST NUMBER: ";
chomp(my $a = <STDIN>);
print "ENTER SECOND NUMBER: ";
chomp(my $b = <STDIN>);
my $min = 0;

if($a<$b){
    $min = $a;
}else{
    $min = $b;
}
for (my $i = $min; $i >= 1; $i--)
{
    if($a % $i == 0 && $b % $i == 0)
    {
        print "GCD = $i\n";
        last;
    }
}


 2 => "abc",
    3 => "def",
    4 => "ghi",
    5 => "jkl",
    6 => "mno",
    7 => "pqrs",
    8 => "tuv",
    9 => "wxyz",
    



















































