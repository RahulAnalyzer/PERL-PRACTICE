use strict;
use warnings;
use Fcntl qw(:flock);

#---- LOCK_EX -> exclusive (Write)
#---- LOCK_SH -> shared (read)
#---- LOCK_UN -> unlock


# 1)----- SAFE APPEND TO A FILE
# 2

# 2) ---- SHARED LOCK (READ SAFELY)
#---- Multiple reader allowed, no writers

# open my $fh,'<','log.txt' or die $!;

# flock($fh, LOCK_SH) or die "Cannot get shared lock";

# while(my $line =<$fh>){
#     print $line;
# }
# flock ($fh, LOCK_UN);
# close $fh;



# 3) ----- FULL EXAMPLE 

sub write_log{
    my ($message) = @_;
    my $log_file = "app.log";


    open my $fh, '>>',$log_file or die "Cannot open log file:$!";

    flock($fh, LOCK_EX) or die "Cannot Lock log file";

    my $timestamp = localtime();
    print $fh "[$timestamp] $$ $message\n";

    close $fh; #auto unlock
}

# Simulate multiple Writes
write_log("User logged in");
write_log("File uploaded");
write_log("Process Completed");