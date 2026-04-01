use strict;
use warnings;
use IO::Select;


my @source = (
    {name => "Source A", delay =>1},
    {name => "Source B", delay =>3},
    {name => "Source C", delay =>2},
);

my @pids;
my $selector = IO::Select->new();

# fork a child for each source and set up a pipe for each
for my $source(@source){
    my ($reader , $writer);
    pipe($reader , $writer) or die "Pipe Failed\n";
    
    my $pid = fork();
    die "Fork Failed:$!" unless defined $pid;
    
    if($pid == 0){
        #child simulate the data
        close($reader);
        sleep($source->{delay}); # each source has different speed
        print $writer "$source->{name}: Here is my Data!\n";
        close($writer);
        exit(0);
    }
    
    close($writer);
    $selector->add($reader);
    push @pids , $pid;
}
print "Watching " . scalar(@source) . " source simultaneously.. \n";


while($selector->count() > 0){
    my @ready = $selector->can_read(5);
    if(@ready == 0 ){
        print "No data in 5 seconds...\n";
        next;
        
    }
    
    for my $handle(@ready){
        my $line = <$handle>;
        if(defined $line){
            chomp $line;
            print "got Data -> $line\n";
        }else{
            $selector->remove($handle);
            close($handle)
        }
    }
}

print "ALL SOURCES DONE\n";
waitpid($_ , 0) for @pids;
































