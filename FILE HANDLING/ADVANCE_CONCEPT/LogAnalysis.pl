use strict;
use warnings;
use FindBin qw($Bin);

# sub count_log_words{
#     my ($file) = @_;

#     my %count =(
#         ERROR => 0,
#         WARN => 0,
#     );
#     open my $fh,'<',$file or die "Cannot Open Log File: $!";
#     while (my $line =<$fh>){
#         $count{ERROR} +=() = $line =~ /ERROR/gi;
#         $count{WARN} +=() = $line =~ /WARN/gi;
#     }
#     close $fh;
#     return %count;
# }

# #-------MAIN ----------
# my $file_path = "$Bin/../TEXT/File.log";
# my %result = count_log_words($file_path);

# print "ERROR COUNT: $result{ERROR}\n";
# print "FAIL COUNT: $result{WARN}\n";

# 2) MORE FLEXIBILE VERSION ( ADVANCED BUT IMPORTANT)

sub count_word_in_log{
    my ($file, @words) = @_;

    my %count;
    @count{@words} = (0) x @words;

    open my $fh,'<', $file or die $!;

    while(my $line =<$fh>){
        for my $word(@words){
            $count{$word} += () = $line =~ /\b\Q$word\E\b/gi;
        }
    }
    close $fh;
    return %count;
}
my $file_path = "$Bin/../TEXT/File.log";
# ------- MAIN --------
my %counts = count_word_in_log($file_path, qw(INFO WARN ERROR timeout));

print "INFO count: $counts{INFO}\n";
print "WARN count: $counts{WARN}\n";
print "ERROR count: $counts{ERROR}\n";
print "Timeout count: $counts{timeout}\n";








