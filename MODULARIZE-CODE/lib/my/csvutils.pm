package My::csvutils;
use strict;
use warnings;
use Text::CSV;
use Exporter 'import';

our EXPORT_OK = qw(read_csv);

sub read_csv{
    my($file) = @_;

    my $csv = Text::CSV->new({binary =>1, auto_diag => 1});
    open my $fh , '<', $file or die "Cannot open this Csv file:$!";

    my @header = $csv->getline($fh);
    my @records;

    while(my $row =$csv->getline($fh)){
        my %rec;
        @rec{@$header} = @$row;
        push @records, \%rec;
    }
    close $fh;
    return @records;

}
1;

