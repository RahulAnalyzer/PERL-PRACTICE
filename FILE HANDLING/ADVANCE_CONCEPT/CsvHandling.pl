# TO handle the CSV File We Use the Text::csv

use strict;
use warnings;
use Text::CSV;
use FindBin qw($Bin);

# my $csv = Text::CSV->new({
#     binary => 1,
#     auto_diag => 1,
# });

# open my $fh, '<', $file_path or die "cannot open CSV File: $!";

#Read Header
# my $header = $csv->getline($fh);

# # Read Data Row # Array based
# while(my $row = $csv->getline($fh)){
#     my($id,$name,$email,$role) =@$row;
#     print "$name($role)->$email\n";
# }

#hash based printing
# while(my $row = $csv->getline($fh)){
#     my %record;
#     @record{@$header} = @$row;

#     print "$record{id} $record{name} ($record{role}) -> $record{email}\n";
# }
# close $fh;

# ------- SUBROUTINE ----------- 

sub read_csv_as_hash{
    my ($file) = @_;

    my @record;
    my $csv = Text::CSV->new({
        binary => 1,
        auto_diag => 1
    });

    open my $fh, '<', $file or die "cannot open File: $!";

    my $header = $csv->getline($fh);

    #read row data
    while(my $row = $csv->getline($fh)){
        my %record;
        @record{@$header} = @$row;

        push @record, \%record;
    }
    close $fh;
    return @record;

}
my $file_path = "$Bin/../TEXT/user.csv";
# ---------- MAIN -----------
my @user = read_csv_as_hash($file_path);
for my $u (@user){
    print "$u->{id} ($u->{name}) ($u->{role}) -> $u->{email}\n";
}

print "AFTER APPENDING The file\n";

# ADDING A NEW ROW IN CSV
sub appedn_csv_file{
    my ($file, @fields) = @_;

    my $csv = Text::CSV->new({binary => 1});

    open my $fh, '>>', $file or die "cannot append in this file: $!";

    $csv->print($fh, \@fields);
    close $fh;
}

appedn_csv_file($file_path,'Ravi','ravi@test.com','tester');

