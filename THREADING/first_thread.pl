use strict;
use warnings;
use threads;


sub worker{
    print "Thread Started\n";
    sleep(2);
    print "Thread Finished\n";
}

my $t = threads->create(\&worker);  
# threads ->(class name) , ->create() ->(method call) , \&worker ->(Reference to the subroutine)

print "Main Thread Continues....\n"; 
# This is Executed by the main thread at this point two thread exist: 1) Main Thread 2) Worker Thread . They Run Concurrently

$t->join();
# This line is Critical Join() Means: "Wait  until this thread finishes execution." so if we remove this line: Main Thread may exit before worker thread completes That can cause unpredictable behaviour.


print "Program Completed\n";


# sub say_hello{
#     print "Hello From Thread\n";
# }

# my $u = threads->create(\&say_hello);
# $u->join();
