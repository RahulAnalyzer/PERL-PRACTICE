use strict;
use warnings;
use threads;
use Thread::Queue;


# Create a Thread safe queue

my $queue = Thread::Queue->new();

#producer Threads
my $Producer = threads->create(sub{
    for my $i(1..5){
        print "Producing: $i\n";
        $queue->enqueue($i);
        sleep(1);
    }
    $queue->enqueue("Done"); #signal for consumer thread
});


# consumer Threads
my $Consumer = threads->create(sub{
    while(1){
        my $item = $queue->dequeue(); #wait if empty;
        last if $item eq 'Done'; # exit signal 
        print "Consuming: $item\n";
        sleep(2);
    }
});

# wait for thread to end
$Producer->join();
$Consumer->join();

print "All Work Is Done\n";
