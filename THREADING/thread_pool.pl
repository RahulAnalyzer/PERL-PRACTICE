use strict;
use warnings;
use threads;
use Thread::Queue;

my $queue = Thread::Queue->new();

my $num_thread = 3;

my @workers;
for(1..$num_thread){
    push @workers , threads->create(\&worker);
}

for my $task(1..10){
    print "Main: Adding Task $task\n";
    $queue->enqueue($task);
    
}

$queue->end();

$_->join() for @workers;
print "All Task Is Compleleted\n";

sub worker{
    while(defined(my $task = $queue->dequeue())){
        print "Thread @{[threads->tid()]} Processing task $task\n";
        sleep(1);
    }
}
