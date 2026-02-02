=BEGIN
Question 1: UserAccount (Very Basic)
Class: UserAccount

Attributes (private by discipline):
username
password

Methods:
get_username()
set_password(new_password)

password length must be ≥ 8
check_password(password) → returns true/false

Rules:
Do NOT print password
No direct {} access in main.pl
=end
=cut
package UserAccount;
use strict;
use warnings;

sub new {
    my ($class, $username) = @_;
    my $self = {
        username => $username,
        password => undef,
    };

    bless $self , $class;
    return $self;
}

sub get_username{
    my ($self) = @_;
    return $self->{username};
}

sub set_password{
    my ($self , $new_password) = @_;
    die "Password must be at least 8 character Long\n"
        if length($new_password) < 8;

    $self->{password} = $new_password;
}

sub check_password {
    my ($self , $input) = @_;
    if ($input eq $self->{password}){
        return 1;
    }else{
        return 0;
    }
}

# sub check_password{
#     my ($self , $input) = @_;
#     return $input eq $self->{password};
# }
1;


