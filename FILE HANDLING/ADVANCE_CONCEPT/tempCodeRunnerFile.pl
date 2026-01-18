open my $fh, '>>', 'log.txt' or die $!;
# flock($fh,LOCK_EX) or die "Cannot lock File";

# print $fh "process $$ Writing safely\n";

# flock($fh,LOCK_UN);
# close $fh;