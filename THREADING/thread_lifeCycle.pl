use strict;
use warnings;
use threads;
use threads::shared;

sub worker{
    print "Worker: Started\n";
    sleep(2); # simulate Work

    print "Worker: Finished\n";
    return "Result from worker\n";
}

print "Main: Before Thread creation\n";

my $t = threads->create(\&worker);
print "Main: After thread Creation\n";

my $result = $t->join();
print "Main: Therad Joined\n";
print "Main: Got Result-> $result\n"