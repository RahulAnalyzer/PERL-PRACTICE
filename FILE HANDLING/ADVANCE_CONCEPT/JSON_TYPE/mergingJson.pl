use strict;
use warnings;
use FindBin qw($Bin);
use JSON;


sub merge_json{
    my ($file1 , $file2 , $output_json) = @_;

    #file path 

    my $path1 = "$Bin/../../TEXT/$file1";
    my $path2 = "$Bin/../../TEXT/$file2";
    my $output_path = "$Bin/../../TEXT/$output_json";

    local $/;

    # reading json file 1
    open my $fh1, '<', $path1 or die "Cannot open the $path1; $!";
    my $json1 = <$fh1>;
    close $fh1;

    #reading json file 2
    open my $fh2, '<', $path2 or die "Cannot open the $path2:$!";
    my $json2 = <$fh2>;
    close $fh2;

    # Decoding the json file 
    my $data1 =  decode_json($json1);
    my $data2 = decode_json($json2);

    # creating a merged logic

    my $merged;
    if(ref($data1) eq 'ARRAY' && ref($data2) eq 'ARRAY'){
        $merged = [@$data1 , @$data2];
    }
    elsif(ref($data1) eq 'HASH' && ref($data2) eq 'HASH'){
        $merged = {%$data1, %$data2};
    }else{
        die "JSON structure are not both ARRAY Or HASH";
    }

    # MERGING BOTH JSON
      open my $out_fh, '>', $output_path or die "cannot Open the file: $!";
      print $out_fh encode_json($merged);
      close $out_fh;
}
merge_json('mergeUser1.json' , 'mergeUser2.json', 'FINALMERGED.json')

# INLINE VERSION 

# my $file1 = "$Bin/../../TEXT/mergeUser1.json";
# my $file2 = "$Bin/../../TEXT/mergeUser2.json";



# # Read json1.json
# open my $fh1, '<', $file1 or die "Cannot open json1.json: $!";
# local $/;
# my $json_text1 = <$fh1>;
# close $fh1;

# # Read json2.json
# open my $fh2, '<', $file2 or die "Cannot open json2.json: $!";
# local $/;
# my $json_text2 = <$fh2>;
# close $fh2;

# # Decode JSON
# my $data1 = decode_json($json_text1);
# my $data2 = decode_json($json_text2);

# # Merge data assuming they are arrays
# my @merged = (@$data1, @$data2);

# # Encode and write to new file
# open my $fh_out, '>', 'merged.json' or die "Cannot open merged.json: $!";
# print $fh_out encode_json(\@merged);
# close $fh_out;






























