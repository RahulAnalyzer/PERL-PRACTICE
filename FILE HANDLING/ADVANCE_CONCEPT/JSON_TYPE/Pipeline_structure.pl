=begin
Proper Design (Pipeline)
Clean separation;
1: Fetch API data
2: validate User
3: log invalide users
4: save filterd user
5: Write analysis report
=end
=cut


use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Text::CSV;

my $url = "https://dummyjson.com/users";


my $data = fetch_api_data($url);

open my $logfh, '>', "error.log" or die $!;
open my $txtfh, '>', "analysis.txt" or die $!;
open my $csvfh, '>', "filtered.csv" or die $!;

my $csv = Text::CSV->new({binary => 1 , eol => "\n"});
$csv->print($csvfh, ["ID", "FirstName", "LastName", "MaideName", "Age", "Gender", "Email", "Phone", "Username", "Password", "Birth-Date", "Blood-Group", "Height", "weight", "City","state", "Country"]);

my ($total, $valid, $invalid , $saved) = process_users( $data, $csv , $csvfh , $logfh);
write_report($txtfh , $total , $valid , $invalid , $saved);

close $logfh;
close $txtfh;
close $csvfh;

print "File is successfully created\n";

# ---------------- MAIN SUBROUTINES ---------------------

# ---------- Fetching Api ----------------

sub fetch_api_data{
    my($url) = @_;

    my $ua = LWP::UserAgent->new(
        timeout => 10,
        agent => "PerlClient/1.0"
    );

    my $response = $ua->get($url);
    die "Request Failed: " . $response->status_line unless $response->is_success;

    return decode_json($response->decoded_content);
}

# --------- Validate User Record --------------
sub validate_user{
    my ($user) = @_;

    return "MISSING USER: " unless defined $user->{id};
    return "MISSING FIRST NAME: " unless defined $user->{firstName};
    return "MISSING LAST NAME: " unless defined $user->{lastName};
    return "INVALID AGE" unless defined $user->{age} && $user->{age} =~ /^\d+$/;
    return "INVALID EMAIL" unless defined $user->{email} && $user->{email} =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return "INVALID PHONE" unless defined $user->{phone} && $user->{phone} =~ /^\+?\d{1,3}\s?\d{1,4}[-\s]?\d{3}[-\s]?\d{3,4}$/;
    return ""; #Valid
}

# ------------- Process Users (Validate + filter + save) ----------------
sub process_users{
    my ($data, $csv , $csvfh , $logfh) = @_;
    my ($total , $valid , $invalid , $saved) = (0,0,0,0);

    foreach my $user(@{$data->{users}}){

        $total++;
        my $error = validate_user($user);

        if($error){
            $invalid++;
            print $logfh "User ID $user->{id}: $error\n";
            next;
        }
        $valid++;

        #filter: age > 30 
        next unless $user->{age} > 30;

        #save into the csv 
        $csv->print($csvfh, [
                $user->{id}, 
                $user->{firstName},  
                $user->{lastName},  
                $user->{maidenName}, 
                $user->{age}, 
                $user->{gender},
                $user->{email},
                $user->{phone}, 
                $user->{username},  
                $user->{password},
                $user->{birthDate},
                $user->{bloodGroup},
                $user->{height},
                $user->{weight},
                $user->{address}->{city},
                $user->{address}->{state},
                $user->{address}->{country},
        ]);
        
    }
    return ($total , $valid , $invalid , $saved);
}

sub write_report{
    my($fh , $total , $valid , $invalid , $saved) = @_;
    print $fh "============USER DATA REPORT ==========\n";
    print $fh "Total records: $total\n";
    print $fh "Valid Records   : $valid\n";
    print $fh "Invalid Records : $invalid\n";
    print $fh "Saved Age > 30  : $saved\n";
}


