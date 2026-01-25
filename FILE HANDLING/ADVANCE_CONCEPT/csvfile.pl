use strict;
use warnings;
use Text::CSV;
use FindBin qw($Bin);

my $file_path = "$Bin/../TEXT/output.csv";

-------------------- WRITE CSV --------------------
sub write_csv {
    my ($file, $rows) = @_;

    my @columns = qw(Name Age City);

    my $csv = Text::CSV->new({
        binary    => 1,
        eol       => "\n",
        auto_diag => 1,
    });

    open my $fh, '>', $file or die "Cannot open $file: $!";

    # header
    $csv->print($fh, \@columns);

    # data
    for my $row (@$rows) {
        my @data = @{$row}{@columns};
        $csv->print($fh, \@data);
    }

    close $fh;
}

# -------------------- READ CSV --------------------
sub read_csv {
    my ($file) = @_;

    my $csv = Text::CSV->new({
        binary    => 1,
        auto_diag => 1,
        headers   => "auto",
    });

    open my $fh, '<', $file or die "Cannot read $file: $!";

    while (my $row = $csv->getline_hr($fh)) {
        print "Name: $row->{Name} | Age: $row->{Age} | City: $row->{City}\n";
    }

    close $fh;
}

# -------------------- DATA --------------------
my $data = [
    { Name => "Rahul",  Age => 21, City => "Chandigarh" },
    { Name => "Raghav", Age => 22, City => "Banur" },
    { Name => "Sehaj",  Age => 20, City => "Mohali" },
    { Name => "Sujal",  Age => 23, City => "Punjab" },
    { Name => "Kamal",  Age => 19, City => "Rajpura" },
];

-------------------- RUN --------------------
write_csv($file, $data);
read_csv($file);


sub append_row{
    my ($file, @fields) = @_;
    my $csv = Text::CSV->new({binary => 1});
    open my $fh, '>>', $file or die "Cannot open File;$!";

    $csv->print($fh,\@fields);
    print $fh "\n";
    close $fh;

}

#main 
append_row($file_path,"Vishal", 23, "UttarPradesh");
