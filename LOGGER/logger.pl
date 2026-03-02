use strict;
use warnings;
use POSIX qw(strftime); # for formatting timestamp
use Fcntl qw(:flock); # for file locking

# -----------------------------------------------
# Log levels — just like severity levels
# Each level has a number so we can compare them
# Higher number = more severe
# -----------------------------------------------

my %LOG_LEVEL = (
    DEBUG => 1, # Detailed info for developer
    INFO => 2, # general information
    WARNING => 3, # something unsual but not breaking
    ERROR => 4, # something broke
    CRITICAL => 5, # something broke badly , need immediate attention
);

# -----------------------------------------------
# The logger function
# Takes: level, message, and optional log file
# Writes a formatted line to the log file
# -----------------------------------------------

sub log_message{
    my ($level , $message , $logfile) = @_;

    #default log file if none specifed
    $logfile //= '/tmp/system.log';
    
    # only log if this level is recognized
    unless (exists $LOG_LEVEL{$level}){
        warn "UNKNOWN log level: $level\n";
        return;
    }

    # build the timestamp
    my $timestamp = strftime("%Y-%m-%d %H:%M:%S" , localtime);

    # build the full log line
    my $log_line = "$timestamp | $$ | $level | $message\n";
    #                timestamp   PID  level    message

    # print to screen as well so we can see it live

    print $log_line;

    #write to file safely using file locking
    open(my $fh , '>>', $logfile) or die "Cannot Open log:";
    flock($fh , LOCK_EX); #lock before writing
    print $fh $log_line;  #write the line
    flock($fh, LOCK_UN);  #unlock after writing
    close($fh);
}


# -----------------------------------------------
# A log reader — reads the log and filters by level
# -----------------------------------------------

sub read_log{
    my ($logfile, $min_level) = @_;
    $logfile //= '/tmp/system.log';
    $min_level //= 'INFO';

    print "\n== Log Entries at $min_level level and above ==\n";
    open(my $fh, '<', $logfile) or die "Cannot read log:$!";
    
    while( my $line = <$fh>){
        chomp $line;

        # Extract the level from the log line
        # Format: timestamp | PID | LEVEL | message
        my ( undef , undef , $level , undef) = split(/\s*\|\s*/ , $line , 4);

        # only show lines at or above the minimum level
        if(exists $LOG_LEVEL{$level} && 
        $LOG_LEVEL{$level} >= $LOG_LEVEL{$min_level}
        ){
            print "$line\n";
        }
    }
    close($fh);
}

# TEST THE LOGGER
log_message('INFO',     'System started successfully');
log_message('DEBUG',    'Loading configuration file');
log_message('INFO',     'Connected to database');
log_message('WARNING',  'Response time is slightly high: 450ms');
log_message('ERROR',    'Failed to connect to backup server');
log_message('CRITICAL', 'Primary database is unreachable!');

read_log('/tmp/system.log', 'WARNING');