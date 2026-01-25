use strict;
use warnings;
use Text::CSV;

use constant EXPECTED_COLS => 12;

# =========================
# CONFIG (SCHEMA)
# =========================

my $SCHEMA = {
 columns => [qw(
        Employee_ID First_Name Last_Name Age
        Department_Region Status Join_Date
        Salary Email Phone Performance_Score Remote_Work
    )],

    required => {
        Employee_ID => 1,
        First_Name  => 1,
        Last_Name   => 1,
        Department_Region => 1,
        Age => 1,
        Status      => 1,
        Join_Date   => 1,
        Salary      => 1,
        Email       => 1,
    },

    validators => {
        Employee_ID => sub { $_[0] =~ /^EMP\d+$/ },

        First_Name => sub { $_[0] =~ /^[A-Za-z]+$/ },
        Last_Name  => sub { $_[0] =~ /^[A-Za-z]+$/ },

        Age => sub {
        defined $_[0] &&
        $_[0] ne '' &&
        $_[0] =~ /^\d+$/ &&
        $_[0] >= 18 &&
        $_[0] <= 65
},


        Department_Region => sub { $_[0] =~ /^[A-Za-z\s\-]+$/ },

        Status => sub {
            $_[0] =~ /^(Active|Inactive|Pending|OnLeave)$/i
        },

        Join_Date => sub {
            $_[0] =~ m{^\d{1,2}/\d{1,2}/\d{4}$}
        },

        Salary => sub { $_[0] =~ /^\d+(\.\d+)?$/ },

        Email => sub {
            $_[0] =~ /^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        },

        Phone => sub { $_[0] =~ /^-?\d+$/ },

        Performance_Score => sub {
            $_[0] =~ /^(Poor|Average|Good|Excellent)$/i
        },

        Remote_Work => sub { $_[0] =~ /^(True|False)$/i },
    },

    recovery_rules => {},
};

    # validators => {
    #     ID => sub { $_[0] =~ /^\d+$/ },

    #     Name => sub { $_[0] =~ /^[A-Za-z\s.]+$/ },

    #     Age => sub { $_[0] =~ /^\d+$/ },

    #     Email => sub {
    #         $_[0] =~ /^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
    #     },

    #     Salary => sub { $_[0] =~ /^\d+$/ },

    #     Department => sub { $_[0] =~ /^[A-Za-z\s]+$/ },

    #     JoinDate => sub {
    #         $_[0] =~ /^\d{4}-\d{2}-\d{2}$/ ||
    #         $_[0] =~ /^\d{2}\/\d{2}\/\d{4}$/ ||
    #         $_[0] =~ /^\d{4}\/\d{2}\/\d{2}$/
    #     },
    # },

    # recovery_rules => {
    #     NAME_COMMA_RECOVERY => 1,
    # },




# =========================
# MAIN


main();

sub main {

    my ($input, $clean, $reject) = @ARGV;

    die <<"USAGE" unless $input;
Usage:
  perl AutoCleanScript.pl <input.csv> [clean.csv] [reject.csv]

Example:
  perl AutoCleanScript.pl ../TEXT/BigMessyData.csv
USAGE

    $clean  ||= $input =~ s/\.csv$/_clean.csv/r;
    $reject ||= $input =~ s/\.csv$/_reject.csv/r;
    my $logf = $input =~ s/\.csv$/_process.log/r;

    process_csv($input, $clean, $reject, $logf, $SCHEMA);
}

# =========================
# ENGINE

sub process_csv {
    my ($input, $clean, $reject, $logf, $schema) = @_;

    my $csv = Text::CSV->new({
        binary              => 1,
        allow_loose_quotes  => 1,
        allow_loose_escapes => 1,
    });

    open my $in,  '<', $input  or die "Cannot open input: $!";
    open my $ok,  '>', $clean  or die "Cannot open clean: $!";
    open my $bad, '>', $reject or die "Cannot open reject: $!";
    open my $log, '>>', $logf  or die "Cannot open log: $!";

    log_msg($log, "START FILE=$input");

    my $header = $csv->getline($in);
    $csv->print($ok,  $header); print $ok "\n";
    $csv->print($bad, [@$header, 'REASON']); print $bad "\n";

    my ($total, $accepted, $rejected, $recovered) = (0, 0, 0, 0);

    while (1) { # This loop Continoues until End Of FILE

        my $row = $csv->getline($in);

        # ---- CSV PARSE ERROR HANDLING ----
        if (!$row) {
            last if $csv->eof;

            my ($code, $msg, $pos) = $csv->error_diag;
            $total++;

            reject(
                $csv, $bad, $log, $total,
                [],
                "CSV_PARSE_ERROR:$msg"
            );

            log_msg($log,
                "CSV ERROR row=$total code=$code pos=$pos msg=$msg"
            );

            next;
        }

        $total++;

        my @recovery;
        my @cols = @$row;

        # -------- STRUCTURE --------
        if (@cols != EXPECTED_COLS) {
            if ($schema->{recovery_rules}{NAME_COMMA_RECOVERY}) {
                my ($fixed, $reason) = recover_name_comma(@cols);
                if ($fixed) {
                    @cols = @$fixed;
                    push @recovery, $reason;
                }
            }
        }

        if (@cols != EXPECTED_COLS) {
            reject($csv, $bad, $log, $total, \@cols, "COLUMN_MISMATCH");
            $rejected++;
            next;
        }

        # -------- NORMALIZE --------
        my %row;
        @row{ @{ $schema->{columns} } } =
            map { normalize($_) } @cols;

        # -------- VALIDATE --------
        my @errors;

        for my $field (keys %{ $schema->{required} }) {
            push @errors, "MISSING_$field"
                unless defined $row{$field};
        }

        for my $field (keys %{ $schema->{validators} }) {
            next unless defined $row{$field};
            push @errors, "INVALID_$field"
                unless $schema->{validators}{$field}->($row{$field});
        }

        # -------- OUTPUT --------
        if (@errors) {
            reject(
                $csv, $bad, $log, $total,
                [ @row{ @{ $schema->{columns} } } ],
                join(',', @errors)
            );
            $rejected++;
        }
        else {
            if (@recovery) {
                $row{Notes} =
                    defined $row{Notes}
                    ? "$row{Notes} | RECOVERED:@recovery"
                    : "RECOVERED:@recovery";
                $recovered++;
                log_msg($log, "ROW=$total RECOVERED RULE=@recovery");
            }

            $csv->print($ok, [ @row{ @{ $schema->{columns} } } ]);
            print $ok "\n";
            $accepted++;
        }
    }

    log_msg($log,
        "SUMMARY total=$total accepted=$accepted recovered=$recovered rejected=$rejected"
    );
    log_msg($log, "END FILE=$input");

    close $_ for ($in, $ok, $bad, $log);
}

# =========================
# HELPERS
# =========================

sub normalize {
    my ($v) = @_;
    return undef unless defined $v;
    $v =~ s/^\s+|\s+$//g;
    $v =~ s/[^\x20-\x7E]//g;
    return $v eq '' ? undef : $v;
}

sub recover_name_comma {
    my @c = @_;
    return unless @c == EXPECTED_COLS + 1;

    my ($id, $name, $age, @rest) = @c;
    return if defined $age && $age =~ /^\d+$/;

    my $new_age = $rest[0];
    return unless defined $new_age && $new_age =~ /^\d+$/;

    return ([ $id, "$name,$age", @rest ], 'NAME_COMMA_RECOVERY');
}

sub reject {
    my ($csv, $fh, $log, $rownum, $cols, $reason) = @_;
    $csv->print($fh, [ @$cols, $reason ]);
    print $fh "\n";
    log_msg($log, "ROW=$rownum REJECTED REASON=$reason");
}

sub log_msg {
    my ($fh, $msg) = @_;
    my $ts = localtime();
    print $fh "$ts | $msg\n";
}
