use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";

use My::FileUtils qw(write_json log_message);

my $output_file = "$Bin/../DATA/output.json";

my $data = [

    { Name => "Rahul",  Age => 21, City => "Chandigarh" },
    { Name => "Raghav", Age => 22, City => "Banur" },
    { Name => "Sehaj",  Age => 20, City => "Mohali" },
    { Name => "Sujal",  Age => 23, City => "Punjab" },
    { Name => "Kamal",  Age => 19, City => "Rajpura" },
];

write_json($output_file, $data);
log_message("INFO", "PROGRAM START");
log_message("WARN" , "THERE IS ERROR");
log_message("END", "CODE IS END");
print "Logging done.\n";
print "Data written to $output_file\n";
