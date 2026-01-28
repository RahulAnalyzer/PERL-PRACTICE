package My::logUtils;

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(Count_keywords);

sub Count_keywords{
    my ($file, @words) = @_;
    open my $fh, '<', $file or die "Cannot Open this file: $!";

    my %counts;
    @counts{@words} = (0) x @words;
    
    while(my $line = <$fh>){
        for my $w (@words){
            $counts{$w} += () = $line =~ /\b\Q$w\E\b/g;

        }
    }
    close $fh;
    return %counts;
}

1;