use strict;
use warnings;
use IO::Select; 

# we need something to watch let create two pipe
# A pipe is simply a connection between two ends
# one end writes data , the other end reads it 
# pipe($read ,$write) create both end in one call.

my ($read1 , $write1); #pipe 1 = its two ends
my ($read2 , $write2); #pipe 2 = its two ends

pipe($read1 , $write1) or die "Could Not Create Pipe1 :$!";
pipe($read2 , $write2) or die "could Not create Pipe2:$!";

# Now fork two children.
# Child 1 will write to pipe 1 after 3 seconds.
# Child 2 will write to pipe 2 after 1 second.
# The parent will watch both pipes and react to whichever is ready first

my $pid1 = fork();
if($pid1 == 0){
    #child 1 
    close($read1); #child only writes, so close the read ends
    sleep(2);
    print $write1 "Message from Source 1!\n";
    close($write1);
    exit(0);
}

my $pid2 = fork();
if($pid2 == 0){
    #child $pid2
    close($read2);
    sleep(3);
    print $write2 "Message From source 2!\n";
    close($write2);
    exit(0);
}

#parent 
#close the write end parent only reads
close($write1);
close($write2);


# now we will set up the IO::Select and add both read handler to it 
my $selector = IO::Select->new();
$selector->add($read1);
$selector->add($read2);

print " Watching both Pipes. Waiting for whoever sends data first..\n";

# the Event Loop
while($selector->count() > 0){
    my @ready = $selector->can_read(5);
    
    if(@ready == 0){
        # nothing was ready in 5 seconds 
        print "Nothing arrived yet , still Waiting..\n";
        next;
    }
    
    # something is ready - loop through whatever handler are ready
    for my $handler(@ready){
        my $line = <$handler>; # read one line from this handler
        
        if(defined $line){
            #we got actual data
            chomp $line;
            print "Recived: $line\n";
        }else{
            print "A Source Finished and closed its connection,.\n";
            $selector->remove($handler); #stop watching this handler
            close($handler);
        }
    }
}

print "\n All Source Finished.\n";
waitpid($pid1 , 0);
waitpid($pid2 , 0);




























