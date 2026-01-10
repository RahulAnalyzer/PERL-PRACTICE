
use strict;
use warnings;

# Scalars
my $age    = 1;
my $name   = "Rahul";
my $salary = 21.5;

print "Age = $age\n";
print "Name = $name\n";
print "Salary = $salary\n";

# Scalar operations
my $str = "GFG" . " is the best";
my $num = 1 + 0;
my $mul = 4 * 9;
my $mix = $str . $num;

print "str = $str\n";
print "num = $num\n";
print "mul = $mul\n";
print "mix = $mix\n";

# Arrays
my @ages  = (10, 20, 30);
my @names = ("Rahul", "Raghav", "Saket", "Sargam");

print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";

# Hashes
my %data = (
    Rahul  => 21,
    Raghav => 20,
    Sehaj  => 22,
);

print "\$data{'Rahul'} = $data{'Rahul'}\n";

# Array slicing and splice
my @marks = (65, 70, 78, 90, 20);
print "@marks[2..4]\n";

splice(@marks, 2, 3, 98..100);
print "@marks\n";


# Numeric sort
my @sorted = sort { $a <=> $b } @marks;
print "sorted array = @sorted\n";

my @lastThree = splice(@marks, -3);
print "@lastThree\n";


# Hash slicing
my %players = (1=>"Rahul", 2=>"Raghav", 3=>"Sehaj", 4=>"Yogita");
my @my_list = @players{1..4};
print "Top 4 player: @my_list\n";

my @arr = (10,20,30);
my $count = @arr;
print "$count\n";

# IF and ELSE STATEMENT IN PERL 


print "Enter a Number: ";
my $a = <STDIN>;
chomp($a);

if($a%2==0)
{
    print"a is even\n";
}
else 
{
    print"a is odd\n";
}

# ElSEIF STATEMENT

print "Enter a Marks: ";
chomp (my $MARKS = <STDIN>);

if ($MARKS >= 90){
    print "GRADE: A+\n";
}
elsif ($MARKS >= 75)
{
    print "GRADE: A\n";
}
elsif ($MARKS >= 60){
    print "GRADE: B\n";
}
elsif ($MARKS >= 40){
    print "GRADE: C\n";
}
else{
    print "FAIL\n";
}


my $op = "add";
my $x = 20;
my $y = 10;

if($op eq "add")
{
    my $res = $x+$y;
    print "Result: $res\n";
}
elsif($op eq "sub")
{
   my $res = $x+$y;
    print "Result: $res\n";
}
elsif($op eq "mul")
{
   my $res = $x*$y;
    print "Result: $res\n";
}
elsif($op eq "div")
{
   my $res = $x/$y;
    print "Result: $res\n";
}
elsif($op eq "Rem")
{
   my $res = $x%$y;
    print "Result: $res\n";
}
else
{
    print "Unknown Operator\n";
}


print "Enter a number: ";
my $number = <STDIN>;
chomp($number);
if ($number % 7 == 0) {
    print "Number is Divisible by 7\n";
} else {
    print "Number is Not divisible by 7\n";
}












































