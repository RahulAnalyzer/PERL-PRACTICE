use strict;
use warnings;
use FindBin qw($Bin);
use Text::CSV;

main();

sub main{
    
     my $input = "$Bin/../TEXT/MessayData.csv";
     my $clean = "$Bin/../TEXT/CleanDataCSV.csv";
     my $reject = "$Bin/../TEXT/RejectCSV.csv";

    Clean_csv($input, $clean , $reject);
}

sub Clean_csv{
    # FIX DECLARE THE SUBROUTINE
    my ($input, $clean , $reject) = @_;

    my $csv = Text::CSV->new({
        Binary => 1,
        auto_diag => 1,
        allow_loose_escapes => 1, 
        allow_loose_quotes => 1,
    });

    open my $in, '<', $input or die "Cannot open the input file: $!";
    open my $ok, '>', $clean or die "Cannot open the Clean File: $!";
    open my $bad, '>', $reject or die "cannot open the Reject File: $!";

    my $header = $csv->getline($in);
    $csv->print($ok , $header);
    print $ok "\n";
    $csv->print($bad, [@$header , 'REASON']);
    print $bad "\n";

    while(my $row = $csv->getline($in)){
        my ($id , $name , $age , $email , $salary , $join_date , $department, $notes) = @$row;
        my @error;
    

    # cleaning data
    #FIX : Added proper variable assignment for the for loop
    #FIX: Clean all fields, not just 5
    for my $field ($id , $name , $age , $email , $salary , $join_date , $department, $notes){
        next unless defined $field;
        $field =~ s/^\s*|\s+$//g;
        $field =~ s/[^\x20-\x7E]//g;
    }

    # validation 
    push @error, 'MISSING NAME' unless $name;
    push @error, 'INVALID ID' unless defined $id && $id =~ /^\d+$/;
    push @error, 'INVALID AGE' unless defined $age && $age =~ /^\d+$/;
    push @error, 'INVALID SALARY' unless defined $salary && $salary =~ /^\d+$/;
    push @error, 'INVALID EMAIL' unless defined $email && $email =~ /^[\w.\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$/;
    


    # FIX: Added validation for join date
        if (defined $join_date && $join_date ne '') {
            # Check for valid date format (yyyy-mm-dd, dd/mm/yyyy, or yyyy/mm/dd)
            unless ($join_date =~ /^\d{4}-\d{2}-\d{2}$/ || 
                    $join_date =~ /^\d{2}\/\d{2}\/\d{4}$/ ||
                    $join_date =~ /^\d{4}\/\d{2}\/\d{2}$/) {
                push @error, 'INVALID DATE FORMAT';
            }
        }
        
        # FIX: Added validation for department
        push @error, 'MISSING DEPARTMENT' unless defined $department && $department ne '';


    # OUTPUT
    if(@error){
        # FIX: Added comma and proper method call syntax
        $csv->print($bad , [@$row, join',',@error]);
        print $bad "\n";
    }
    else{
        $csv->print($ok, [$id, $name, $age, $email, $salary, $join_date, $department, $notes]);
        print $ok "\n";

    }
}
# FIX Moved close statement inside the Subroutine
close $in;
close $ok;
close $bad;
}

# use strict;
# use warnings;
# use FindBin qw($Bin);
# use Text::CSV;

# sub Cleaning_Csv{
#     my($input_file, $output_file) = @_;
#     my $csv = Text::CSV->new({Binary => 1, auto_diag =>1, sep_char => ',', allow_loose_quotes => 1, allow_loose_escapes => 1,});

#     open my $in, '<',$input_file or die "cannot open $input_file:$!";
#     open my $out, '>',$output_file or die "cannot open $output_file:$!";

#     while(my $row = $csv->getline($in)){

#        for my $field(@$row){
#         next unless defined $field;
#         $field =~ s/^\s+|\s+$//g;        # trim
#         $field =~ s/[^\x20-\x7E]//g;     # remove non-printable
#        } 
#         $csv->print($out,$row);
#         print $out "\n";
       
#     }
#     close $in;
#     close $out;
# }
# my $file_path = "$Bin/../TEXT/MessayData.csv";
# Cleaning_Csv($file_path,'CleanData.csv');
# use strict;
# use warnings;
# use Text::CSV;
# use FindBin qw($Bin);
# use Time::Piece;

# my $INPUT  = "$Bin/../TEXT/MessayData.csv";
# my $CLEAN  = "$Bin/../TEXT/CleanData.csv";
# my $REJECT = "$Bin/../TEXT/RejectedData.csv";

# my %RULES = (
#     'ID' => { required => 1, type => 'int' },
#     'Name' => { required => 1, trim => 1, collapse => 1 },
#     'Age' => { type => 'int', min => 18, max => 65 },
#     'Email' => { required => 1, type => 'email' },
#     'Salary' => { type => 'int' },
#     'Join Date' => { type => 'date' },
# );

# my $csv = Text::CSV->new({
#     binary               => 1,
#     auto_diag            => 1,
#     allow_loose_quotes   => 1,
#     allow_loose_escapes  => 1,
# });

# open my $in, '<', $INPUT or die "Cannot open input: $!";
# open my $ok, '>', $CLEAN or die "Cannot open clean: $!";
# open my $bad,'>', $REJECT or die "Cannot open reject: $!";

# my $header = $csv->getline($in);
# $csv->print($ok,  $header); print $ok "\n";
# $csv->print($bad, [ @$header, 'REASON' ]); print $bad "\n";

# while (my $row = $csv->getline($in)) {

#     my %data;
#     @data{@$header} = @$row;

#     my @errors;

#     for my $col (@$header) {

#         my $val   = $data{$col};
#         my $rule  = $RULES{$col} || {};

#         if (defined $val) {
#             $val =~ s/^\s+|\s+$//g if $rule->{trim};
#             $val =~ s/\s{2,}/ /g  if $rule->{collapse};
#         }

#         if ($rule->{required} && !defined $val) {
#             push @errors, "$col missing";
#             next;
#         }

#         if ($rule->{type}) {

#             if ($rule->{type} eq 'int') {
#                 if (defined $val && $val =~ /^\d+$/) {
#                     if ((defined $rule->{min} && $val < $rule->{min}) ||
#                         (defined $rule->{max} && $val > $rule->{max})) {
#                         push @errors, "$col out of range";
#                     }
#                 } else {
#                     push @errors, "$col not integer";
#                 }
#             }

#             if ($rule->{type} eq 'email') {
#                 push @errors, "$col invalid"
#                     unless defined $val && $val =~ /^[\w.+-]+\@[\w.-]+\.[A-Za-z]{2,}$/;
#             }

#             if ($rule->{type} eq 'date') {
#                 eval {
#                     $val = Time::Piece->strptime($val, '%Y-%m-%d')->ymd;
#                     $data{$col} = $val;
#                 };
#                 push @errors, "$col invalid date" if $@;
#             }
#         }

#         $data{$col} = $val;
#     }

#     if (@errors) {
#         $csv->print($bad, [ @data{@$header}, join('; ', @errors) ]);
#         print $bad "\n";
#     } else {
#         $csv->print($ok,  [ @data{@$header} ]);
#         print $ok "\n";
#     }
# }

# close $in;
# close $ok;
# close $bad;


