#problem 6:
print "Enter strings (end with Ctrl+D):\n";
my @inputs = <STDIN>;
chomp @inputs;
my @filtered = grep { defined($_) && $_ ne '' } @inputs;
print "Filter name: @filtered\n";
