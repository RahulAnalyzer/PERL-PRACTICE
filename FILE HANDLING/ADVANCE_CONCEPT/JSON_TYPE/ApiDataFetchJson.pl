use strict;
use warnings;
use JSON;
use Text::CSV;
use LWP::UserAgent;
use bytes;

# API URL
my $url = "https://dummyjson.com/users";

#fetch API response 
my $ua = LWP::UserAgent->new(
    timeout => 10,
    agent => "PerlClient/1.0"
);
#perform GET Request
my $response = $ua->get($url);
unless ($response->is_success){
    die "Error Fetching data:" . $response->status_line;
}

#decode Json 
my $json_text = $response->decoded_content;
my $data = decode_json($json_text);


# to find the length of the json DATA
my $len = length($data);
print "Length of this json is : $len\n";

# loop through user

for my $user (@{$data->{users}}){ 
    if($user->{age} > 30) {
    print "ID: ",  $user->{id},  "\n";
    print "First Name: ", $user->{firstName},  "\n";
    print "Last Name: ", $user->{lastName},  "\n";
    print "Maiden Name: ", $user->{maidenName},  "\n";
    print "Age: ", $user->{age},  "\n";
    print "Gender: ", $user->{gender},  "\n";
    print "Phone: ", $user->{phone},  "\n";
    print "Username: ", $user->{username},  "\n";
     print "Hair     : $user->{hair}->{color} ($user->{hair}->{type})\n";

    print "City     : $user->{address}->{city}\n";
    print "State    : $user->{address}->{state}\n";
    print "Country  : $user->{address}->{country}\n";

    print "Latitude : $user->{address}->{coordinates}->{lat}\n";
    print "Longitude: $user->{address}->{coordinates}->{lng}\n";

    print "-" x 40, "\n";
    }
}
my $total_user = scalar @{$data->{users}};
print "Total users = $total_user\n";
print "JSON SIZE = ", length($json_text) ,  "bytes\n";


#create CSV Writer 
my $csv = Text::CSV->new({binary => 1 , eol => "\n"});
open my $fh , '>', "user.csv" or die "Cannot write this file:$!";

#write the header
$csv->print($fh, ["ID", "FirstName", "LastName", "MaideName", "Age", "Gender", "Email", "Phone", "Username", "Password", "Birth-Date", "Blood-Group", "Height", "weight", "City","state", "Country"]);

#write User row

for my $user (@{$data->{users}}){
    next unless $user->{age} > 30;
    $csv->print($fh,[
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
close $fh;
print "CSV file is Created Successfully: user.csv\n";

