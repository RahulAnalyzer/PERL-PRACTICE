use strict;
use warnings;
use threads;
use Thread::Queue;

my $queue = Thread::Queue->new();

# sub worker{
#     while(my $item = $queue->dequeue()){
#         print "Processing $item\n";
#     }
# }

# threads->create(\&worker);

# $queue->enqueue(1,2,3);
# $queue->end();

# sleep(1);


# SIMPLE TASK PROCESSING SYSTEM 
# SCENARIO: Main Thread gives numbers. Worker thread squares them.
sub worker{
    while(1){
        my $num = $queue->dequeue();
        last if $num eq "STOP";

        my $result = $num * $num;
        print "Processes $num->$result\n";
    }
    print "Worker Exiting\n";

}

my $t = threads->create(\&worker);

#producer adds tasks
for my $i (1..5)
{
    $queue->enqueue($i);
}

# Tell worker to stop
$queue->enqueue("STOP");
$t->join();
print "Main Finished\n";


# What’s Happening Step-by-Step
# We create a queue.
# Worker thread starts and waits on dequeue().
# Main thread adds numbers 1–5 into queue.
# Worker takes one number at a time.
# Worker processes it.
# When it receives "STOP", it exits.
# Main waits using join().



=begin
Next Topic Detached Threads
$t->join();
That means 
Main waits For thread. But sometimes you dont want to wait
example
Logging thread
background monitoring
cleanup tasks

For That , Perl Provides:
$t->detach();

Defination : 
=end
=cut

sub background_task{
    sleep(2);
    print "Background task done\n";
}

my $t = threads->create(\&background_task);
$t->detach();

print "Main Continues without waiting\n";
sleep(3)