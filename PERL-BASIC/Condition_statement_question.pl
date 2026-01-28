<<<<<<< HEAD
# Problem 1 : Even and Odd checker

use strict;
use warnings;

my $num = 7;

if ($num % 2 == 0) {
    print "Even\n";
} else {
    print "Odd\n";
}

print "\n";


# problem 2: Department List Printer

my @departments = ("HR", "Finance", "IT", "Sales");

foreach my $dept (@departments) {
    print "$dept\n";
}

print "\n";


# problem 3 : countdown Script

my $count = 10;

while ($count >= 1) {
    print "$count\n";
    $count--;
}

print "Blast Off!\n";

print "\n";

# problem 4: Production target Checker
my @production = (120, 95, 110, 80);
my $target = 100;

for (my $i = 0; $i < @production; $i++) {
    if ($production[$i] < $target) {
        print "Day ", $i + 1, ": $production[$i] units (below target)\n";
    }
}

print "\n";

# problem 5: Attaendance Validator

my $attendance = 88;

if ($attendance >= 90) {
    print "Excellent\n";
} elsif ($attendance >= 75) {
    print "Satisfactory\n";
} else {
    print "Poor\n";
}

print "\n";


# Problem 6: Odd Number Printer with Skip
for (my $i = 1; $i <= 30; $i++) {

    if ($i % 2 == 0) {
        next;
    }

    if ($i % 5 == 0) {
        next;
    }

    print "$i\n";
}

print "\n";


# Problem 7: Order Processing Simulator
my @orders = ("Pending", "Processing", "Delivered", "Failed", "Pending");

foreach my $status (@orders) {

    if ($status eq "Failed") {
        print "Processing stopped due to Failed status.\n";
        last;
    }

    print "Processing order: $status\n";
}

print "\n";

# Problem 8: Age Validator and Counter
my @ages = (16, 21, 18, 25, 14);
my $count = 0;

foreach my $age (@ages) {
    if ($age > 18) {
        $count++;
    }
}

print "Number of customers above 18: $count\n";

print "\n";

# Problem 9: Compound Interest Calculator
my $principal = 1000;
my $rate = 5;
my $years = 3;

my $year = 1;

while ($year <= $years) {
    $principal = $principal * (1 + $rate / 100);
    printf "Year %d: %.2f\n", $year, $principal;
    $year++;
}

=======
# Problem 1 : Even and Odd checker

use strict;
use warnings;

my $num = 7;

if ($num % 2 == 0) {
    print "Even\n";
} else {
    print "Odd\n";
}

print "\n";


# problem 2: Department List Printer

my @departments = ("HR", "Finance", "IT", "Sales");

foreach my $dept (@departments) {
    print "$dept\n";
}

print "\n";


# problem 3 : countdown Script

my $count = 10;

while ($count >= 1) {
    print "$count\n";
    $count--;
}

print "Blast Off!\n";

print "\n";

# problem 4: Production target Checker
my @production = (120, 95, 110, 80);
my $target = 100;

for (my $i = 0; $i < @production; $i++) {
    if ($production[$i] < $target) {
        print "Day ", $i + 1, ": $production[$i] units (below target)\n";
    }
}

print "\n";

# problem 5: Attaendance Validator

my $attendance = 88;

if ($attendance >= 90) {
    print "Excellent\n";
} elsif ($attendance >= 75) {
    print "Satisfactory\n";
} else {
    print "Poor\n";
}

print "\n";


# Problem 6: Odd Number Printer with Skip
for (my $i = 1; $i <= 30; $i++) {

    if ($i % 2 == 0) {
        next;
    }

    if ($i % 5 == 0) {
        next;
    }

    print "$i\n";
}

print "\n";


# Problem 7: Order Processing Simulator
my @orders = ("Pending", "Processing", "Delivered", "Failed", "Pending");

foreach my $status (@orders) {

    if ($status eq "Failed") {
        print "Processing stopped due to Failed status.\n";
        last;
    }

    print "Processing order: $status\n";
}

print "\n";

# Problem 8: Age Validator and Counter
my @ages = (16, 21, 18, 25, 14);
my $count = 0;

foreach my $age (@ages) {
    if ($age > 18) {
        $count++;
    }
}

print "Number of customers above 18: $count\n";

print "\n";

# Problem 9: Compound Interest Calculator
my $principal = 1000;
my $rate = 5;
my $years = 3;

my $year = 1;

while ($year <= $years) {
    $principal = $principal * (1 + $rate / 100);
    printf "Year %d: %.2f\n", $year, $principal;
    $year++;
}

>>>>>>> master
