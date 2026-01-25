use strict;
use warnings;
use FindBin qw($Bin);
use JSON qw(decode_json encode_json);
use Text::CSV;

sub JsonToCsv{
    my ($json_file , $csv_file) = @_;

    my $json_path = "$Bin/../../TEXT/$json_file";
    my $csv_path = "$Bin/../../TEXT/$csv_file";

    open my $json_fh, '<' , $json_path or die "Cannot Open this file:$!";
    local $/;
    my $json_text = <$json_fh>;
    close $json_fh;

    my $data = decode_json($json_text);
    die "JSON data is not an array" unless ref($data) eq 'ARRAY';


    my $csv = Text::CSV->new({binary => 1, eol => "\n"});
    open my $csv_fh, '>', $csv_path or die "Cannot Open $csv_path: $!";
    my @header = sort keys %{$data->[0]};

    $csv->print($csv_fh, \@header);
    for my $row(@$data){
        my @values = map {$row->{$_} // ''} @header;
        $csv->print($csv_fh, \@values);

    }  
    close $csv_fh;
}
JsonToCsv('merged.json', 'CsvToJson.csv')