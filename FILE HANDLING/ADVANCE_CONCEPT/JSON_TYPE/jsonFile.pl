use strict;
use warnings;
use FindBin qw($Bin);
use JSON;

sub read_json_file{
    my ($file) = @_;
    open my $fh, '<' ,$file or die "cannot open this Json File:$!";
    local $/;

    my $json_text = <$fh>;
    close $fh;

    return decode_json($json_text);

}

my $file_path = "$Bin/../../TEXT/users.json";
# ------------MAIN ------------
my $user = read_json_file($file_path);

for my $u (@$user){
    print "$u->{id}: $u->{name} -> $u->{email} ($u->{role})\n";
}