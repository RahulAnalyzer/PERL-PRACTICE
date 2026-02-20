use strict;
use warnings;
use threads;
use Thread::Queue;
use Text::CSV;
use FindBin qw($Bin);

my $input  = "$Bin/MessayData.csv";
my $clean  = "$Bin/CleanDataCSV.csv";
my $reject = "$Bin/RejectCSV.csv";

my $input_q  = Thread::Queue->new();
my $output_q = Thread::Queue->new();



my $WORKERS = 2;

# ---------------- Worker ----------------
sub worker {
    while (my $row = $input_q->dequeue()) {

        my ($id,$name,$age,$email,$salary,$join_date,$department,$notes) = @$row;
        my @error;

        push @error, 'MISSING NAME' unless $name;
        push @error, 'INVALID ID' unless defined $id && $id =~ /^\d+$/;

        if (@error) {
            $output_q->enqueue(['BAD', $row, join(',',@error)]);
        }
        else {
            $output_q->enqueue(['OK', $row]);
        }
    }
}

# ---------------- Writer ----------------
sub writer {
    my $csv = Text::CSV->new({binary => 1});

    open my $ok,  '>', $clean  or die $!;
    open my $bad, '>', $reject or die $!;

    while (my $data = $output_q->dequeue()) {

        my ($type, $row, $reason) = @$data;

        if ($type eq 'OK') {
            $csv->print($ok, $row);
            print $ok "\n";
        }
        else {
            $csv->print($bad, [@$row, $reason]);
            print $bad "\n";
        }
    }

    close $ok;
    close $bad;
}

# Start workers
my @workers = map { threads->create(\&worker) } 1..$WORKERS;

# Start writer
my $writer = threads->create(\&writer);

# ---------------- Producer ----------------
my $csv = Text::CSV->new({
    binary => 1,
    auto_diag => 1,
    allow_loose_quotes => 1,
    allow_loose_escapes => 1,
});

open my $in, '<', $input or die $!;

while (my $row = $csv->getline($in)) {
    $input_q->enqueue($row);
}

close $in;

# Send termination signals to workers
$input_q->enqueue((undef) x $WORKERS);

$_->join() for @workers;

# Stop writer
$output_q->enqueue(undef);
$writer->join();

print "Processing completed.\n";
