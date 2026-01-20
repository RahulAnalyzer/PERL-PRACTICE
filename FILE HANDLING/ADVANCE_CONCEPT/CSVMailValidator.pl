use strict;
use warnings;
use FindBin qw($Bin);
use Text::CSV;

# -------- SUBROUTINE ----------

sub csv_mail_validator{
    my($file) = @_;
    my @valid_user;

    my $csv = Text::CSV->new({binary => 1, auto_diag => 1,});
    
    open my $fh, '<', $file or die "Cannot Check this file: $!";

    my $header = $csv->getline($fh);
    while(my $row = $csv->getline($fh)){
        my %user;
        @user{@$header} = @$row;

        #----- VALIDATIONS ------
        next unless $user{id} =~ /\d+$/;
        next unless $user{name};
        next unless $user{role} =~ /^(admin|manager|user)$/;
        next unless $user{email} =~ /^[^\s\@]+@[^\s\@]+\.[^\s\@]+$/;

        push @valid_user, \%user;
    }
    close $fh;
    return \@valid_user;
}
my $file_path = "$Bin/../TEXT/InvalidCSV.csv";

my $user_ref = csv_mail_validator($file_path);
my @users = @$user_ref;


for my $u (@users){
    print "$u->{id} $u->{name} ($u->{role}) -> ($u->{email})\n";
}


