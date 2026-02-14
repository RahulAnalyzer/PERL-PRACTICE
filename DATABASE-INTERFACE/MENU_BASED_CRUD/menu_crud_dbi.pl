use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";
use MyApp::DB;


main();
sub main{
    my $db = MyApp::DB->new();

    while(1){
        print "\n=======  JSONDETAIL CRUD MENU =========\n";
        print "1. Create User\n";
        print "2. Read User\n";
        print "3. Update User\n";
        print "4. Delete User\n";
        print "5. List User\n";
        print "6. Exit\n";
        print "Choose Option: ";

        chomp(my $choice = <STDIN>);
        
        if($choice == 1){
            menu_create($db);
        }
        elsif($choice == 2){
            menu_read($db);
        }
        elsif($choice == 3){
            menu_update($db);
        }
        elsif($choice == 4){
            menu_delete($db);
        }
        elsif($choice == 5){
            menu_list($db);
        }elsif($choice == 6){
            print "Exiting..\n";
            last;
        }else{
            print "INVALID CHOICE. TRY AGAIN.\n";
        }

    }
}

sub menu_create{
    my ($db) = @_;
    
    print "Enter ID: ";
    chomp(my $id = <STDIN>);

    print "Enter First Name: ";
    chomp(my $first = <STDIN>);

    print "Enter Last Name: ";
    chomp(my $last = <STDIN>);

    print "Enter Age: ";
    chomp(my $age = <STDIN>);

    print "Enter Gender: ";
    chomp(my $gender = <STDIN>);

    print "Enter a Email: ";
    chomp(my $email = <STDIN>);

    $db->create_user({
        id => $id,
        firstName => $first,
        lastName => $last,
        age => $age,
        gender => $gender,
        email => $email
    });

    print "USER INSERTED (if Not Exists).\n";
}

sub menu_read {

    my ($db) = @_;

    print "Enter ID: ";
    chomp(my $id = <STDIN>);

    my $user = $db->read_user($id);

    if ($user) {
        print "\nUser Details:\n";
        print "ID: $user->{id}\n";
        print "Name: $user->{firstname} $user->{lastname}\n";
        print "Age: $user->{age}\n";
        print "Gender: $user->{gender}\n";
        print "Email: $user->{email}\n";
    }
    else {
        print "User not found.\n";
    }
}


sub menu_update {

    my ($db) = @_;

    print "Enter ID: ";
    chomp(my $id = <STDIN>);

    print "Enter New Age: ";
    chomp(my $age = <STDIN>);

    my $rows = $db->update_user($id, $age);

    print "$rows row(s) updated.\n";
}

sub menu_delete {

    my ($db) = @_;

    print "Enter ID: ";
    chomp(my $id = <STDIN>);

    my $rows = $db->delete_user($id);

    print "$rows row(s) deleted.\n";
}

sub menu_list {

    my ($db) = @_;

    my $users = $db->list_users();

    print "\nAll Users:\n";

    for my $u (@$users) {
        print "$u->{id} - $u->{firstname} $u->{lastname}\n";
    }
}
