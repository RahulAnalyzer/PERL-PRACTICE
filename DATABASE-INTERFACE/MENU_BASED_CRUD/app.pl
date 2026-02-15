use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use MyApp::DB;
use JSON;

my $method = shift @ARGV;
my $route  = shift @ARGV;

die "Usage: perl app.pl METHOD /route\n"
    unless $method && $route;

my $db = MyApp::DB->new();

# ROUTING LOGIC

if ($method eq 'GET' && $route eq '/users') {

    my $users = $db->list_user();
    print encode_json($users) . "\n";
}

elsif ($method eq 'GET' && $route =~ m{^/users/(\d+)$}) {

    my $id = $1;
    my $user = $db->read_user($id);

    if ($user) {
        print encode_json($user) . "\n";
    } else {
        print "User not found\n";
    }
}

elsif ($method eq 'POST' && $route eq '/users') {

    print "Enter ID: "; chomp(my $id = <STDIN>);
    print "Enter First Name: "; chomp(my $first = <STDIN>);
    print "Enter Last Name: "; chomp(my $last = <STDIN>);
    print "Enter Age: "; chomp(my $age = <STDIN>);
    print "Enter Email: "; chomp(my $email = <STDIN>);

    eval {
        $db->create_user({
            id        => $id,
            firstName => $first,
            lastName  => $last,
            age       => $age,
            email     => $email
        });
        $db->commit_tx();
    };

    if ($@) {
        $db->rollback_tx();
        print "Error creating user\n";
    } else {
        print "User created successfully\n";
    }
}

elsif ($method eq 'PUT' && $route =~ m{^/users/(\d+)$}) {

    my $id = $1;

    print "Enter new age: ";
    chomp(my $age = <STDIN>);

    eval {
        $db->update_user($id, $age);
        $db->commit_tx();
    };

    if ($@) {
        $db->rollback_tx();
        print "Update failed\n";
    } else {
        print "User updated\n";
    }
}

elsif ($method eq 'DELETE' && $route =~ m{^/users/(\d+)$}) {

    my $id = $1;

    eval {
        $db->delete_user($id);
        $db->commit_tx();
    };

    if ($@) {
        $db->rollback_tx();
        print "Delete failed\n";
    } else {
        print "User deleted\n";
    }
}

else {
    print "Route not found\n";
}
