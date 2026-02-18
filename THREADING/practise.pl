use strict;
use warnings;
use threads;

# simple thread funciton 

sub hello_thread{
    my $name = shift;
    print "Hello from thread: $name\n";
    return "Thread $name Completed";
}

# Create Threads
my $thread1 = threads->create(\&hello_thread , "Thread-1");
my $thread2 = threads->create(\&hello_thread , "Thread-2");

# Wait for threads to complete and get thier return values
my $result1 = $thread1->join();
my $result2 = $thread2->join();

print "Results: $result1 , $result2\n";