package My::FileUtils;


use strict;
use warnings;

use JSON qw(decode_json encode_json to_json);
use Exporter 'import';

our @EXPORT_OK = qw( 
    read_json  
    write_json 
    file_exists
    log_message
);

sub file_exists{
    my ($file) = @_;
    return -e $file;
}

sub read_json{
    my ($file) = @_;
    open my $fh, '<' ,$file or die "cannot open this Json File:$!";
    local $/;
    my $json_text = <$fh>;
    close $fh;
    return decode_json($json_text);
}

sub write_json{
    my ($file,$data) = @_;
    open my $fh, '>' ,$file or die "cannot open this Json File:$!";
    print $fh to_json($data, {pretty => 1});
    close $fh;

    return 1;
}

sub log_message{
    my ($file, $level, $msg) = @_;
    open my $fh, '>>', $file or die "cannot open the file:$!";

    my $time = localtime();
    print $fh "[$time] $level: $msg\n";
    close $fh;
}
1;

