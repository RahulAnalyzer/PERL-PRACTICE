use strict;
use warnings;
use DBI;

main();

#--------------------------
# LOGGER
#--------------------------

sub log_action{
    my ($op , $msg) =  @_;
    open my $fh, '>>' , "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/DATABASE-INTERFACE/DBI-JSON/user_aduit.log" or warn "Cannot open log:$!";
    my $time = scalar localtime();
    print $fh "$time | $op | $msg\n";
    close $fh;
}

#-------------
# MAIN FLOW
#-------------

sub main{
    my $dbh = get_dbh();

    log_action('APP_START', 'program started');

    print "\n----CREATE USER----\n";
    create_user($dbh , 999, 'TEST' , 'JOE' , undef , 30 , 'male' ,
        'test999@gmail.com' , '123456789' , 'testuser' ,
        'testpass' , '1995-01-01' , 175.50 , 70.20);

    print "\n------READ USER-------\n";
    my $users = read_user($dbh , 999);
    print_user($users) if $users;

    print "\n------UPDATE------\n";
    update_user($dbh , 999 , 35);

    print "\n-------READ AFTER UPDATE-------\n";
    $users = read_user($dbh, 999);
    print_user($users) if $users;

    print "\n------DELETE USER------\n";
    delete_user($dbh , 999);

    print "\n----- VERIFY DELETE------\n";
    $users = read_user($dbh , 999);
    print $users ? "Still exist\n" : "User Deleted Successfully\n";

    log_action('APP_END', 'program finished');

    $dbh->disconnect;
};

sub get_dbh{
    my $dsn  = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
    my $user = "postgres";
    my $pass = 'rahul';

    return DBI->connect(
        $dsn, $user , $pass ,
        { RaiseError => 1 , AutoCommit => 1 }
    );
}


sub create_user{
    my ($dbh , @values) = @_;
    my $id = $values[0];

    my $psql = q{

        INSERT INTO jsondetail (id , firstName , lastName , maidenname , age , gender, email , phone , username , password , birthDate , height , weight)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
        ON CONFLICT (id) DO NOTHING
    };

    my $sth = $dbh->prepare($psql);
    my $rows = $sth->execute(@values);
    $sth->finish;

    log_action('INSERT' , "id=$id rows=$rows");
    print "USER INSERTED (if not exists)";
}

sub update_user{
    my ($dbh , $id , $new_age) = @_;

    my $old = read_user($dbh , $id);
    my $old_age = $old ? $old->{age} : 'NA';

    my $sth = $dbh->prepare(
        "UPDATE jsondetail SET age = ? 
        WHERE id = ?"
    );

    my $row = $sth->execute($new_age , $id);
    $sth->finish;

    log_action('UPDATE' , "id=$id age:$old_age->new_age rows=$row");
    
    print "$row ROWS(s) UPDATED\n";

}

sub delete_user{
    my ($dbh , $id) = @_;

    my $sth = $dbh->prepare(
        "DELETE FROM jsondetail WHERE id = ?"

    );
    my $rows = $sth->execute($id);
    $sth->finish;

    log_action('DELETE' , "id=$id rows=$rows");

    print "$rows ROWS(S) IS DELETED";
}

sub read_user{
    my($dbh , $id) = @_;
    my $sth = $dbh->prepare(
        "SELECT * FROM jsondetail WHERE id = ?"
    );
    $sth->execute($id);
    my $rows = $sth->fetchrow_hashref;
    $sth->finish;
    return $rows;

    log_action('READ' , "id=$id");
}

sub print_user {

    my ($u) = @_;

    print "ID: $u->{id}\n";
    print "Name: $u->{firstname} $u->{lastname}\n";
    print "Age: $u->{age}\n";
    print "Email: $u->{email}\n";
}