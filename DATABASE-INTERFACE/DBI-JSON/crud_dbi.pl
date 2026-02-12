=begin
we will  build
get_dbh()
create_user()
read_user()
update_user()
delete_user()
list_user()

we will use existing table (jsondetail)
=end
=cut

use strict;
use warnings;
use DBI;

main();

sub main{
    my $dbh = get_dbh();
    
    print "\n----CREATE USER----\n";
    create_user($dbh , 999, 'TEST' , 'JOE' , undef , 30 , 'male' , 'test999@gmail.com' , '123456789' , 'testuser' , 'testpass' , '1995-01-01' , 175.50 , 70.20);

    print "\n------READ USER-------\n";
    my $users = read_user($dbh , 999);
    print_user($users) if $users;

    print "\n------UPDATE------\n";
    update_user($dbh , 999 , 35);

    print "\n-------READ AFTER UPDATE-------\n";
    $users = read_user($dbh, 999);
    print_user($users) if $users;

    print "\n------DELET USER------\n";
    delete_user($dbh , 999);

    print "\n----- VERFITY DELETE------\n";
    $users = read_user($dbh , 999);
    print $users ? "Still exist\n" : "User Deleted Successfully\n";

    $dbh->disconnect;
    
}

# CREATING THE DBI CONFIG
sub get_dbh{
    my $dsn  = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
    my $user = "postgres";
    my $pass = 'rahul';

    return DBI->connect(
        $dsn, $user , $pass ,
        {RaiseError => 1 , AutoCommit => 1}
    );
}

# METHOD TO CREATE THE USER
sub create_user{
    my ($dbh , @values) = @_;
    my $psql = q{

        INSERT INTO jsondetail (id , firstName , lastName , maidenname , age , gender, email , phone , username , password , birthDate , height , weight)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
        ON CONFLICT (id) DO NOTHING
    };

    my $sth = $dbh->prepare($psql);
    $sth->execute(@values);
    $sth->finish;

    print "USER INSERTED (if not exists)";
}


#METHOD TO READ THE USER
sub read_user{
    my ($dbh , $id) = @_;
    my $sth = $dbh->prepare(
        "SELECT * FROM jsondetail WHERE id = ?"
    );

    $sth->execute($id);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;
    return $row;
}

#METHOD TO UPDATE THE USER
sub update_user{
    my ($dbh , $id , $new_age) = @_;
    my $sth = $dbh->prepare(
        "UPDATE jsondetail SET age = ? 
        WHERE id = ?"
    );

    my $row = $sth->execute($new_age, $id);
    $sth->finish;

    print "$row row(s) updated\n";
}

#METHOD TO UPDATE THE USER
sub delete_user{
    my ($dbh , $id) = @_;
    my $sth = $dbh->prepare(
        "DELETE FROM jsondetail WHERE id = ?"
    );

    my $row = $sth->execute($id);
    $sth->finish;

    print "$row row(s) is deleted";

}

#METHOD TO LIST THE USER FROM DATABASE
sub list_user{
    my ($dbh) = @_;
    my $sth = $dbh->prepare(
        "SELECT * FROM jsondetail ORDER BY id"
    );
    $sth->execute;
    my $row = $sth->fetchall_hashref({});
    $sth->finish;
    return $row;
}

# METHOD TO PRINT THE USER FROM THE DATABASE 
sub print_user {

    my ($u) = @_;

    print "ID: $u->{id}\n";
    print "Name: $u->{firstname} $u->{lastname}\n";
    print "Age: $u->{age}\n";
    print "Email: $u->{email}\n";
}
