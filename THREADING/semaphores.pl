use threads;
use Thread::Semaphore;

my $sem = Thread::Semaphore->new(1); # initialize semaphore

my $thr = threads->create(sub {
    $sem->down(); # acquire
    print "Thread 1 working\n";
    sleep(1);
    $sem->up();   # release
});

my $thr2 = threads->create(sub {
    $sem->down();
    print "Thread 2 working\n";
    sleep(1);
    $sem->up();
});

$thr->join();
$thr2->join();