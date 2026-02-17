use strict;
use warnings;
use DBI;


# --------- DBI CONFIG ----------

my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
my $user = 'postgres';
my $pass = 'rahul';

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError =>1,
        AutoCommit =>1
    }
) or die "DB Connection Failed\n";

#----------- CLI Parsing ------------

my $action = shift @ARGV or die "No action Provided\n";
eval{
    if($action eq 'create'){
        create_user(@ARGV);
    }
    elsif($action eq 'update'){
        update_user(@ARGV);
    }
    elsif($action eq 'delete'){
        delete_user(@ARGV);
    }
    elsif($action eq 'list'){
        list_user(@ARGV);
    }
    elsif
        ($action eq 'report'){
            report(@ARGV);
        }
    else{
        die "Invalid Command\n";
    }
};

if($@){
    print "ERROR:$@\n";
}
$dbh->disconnect;

# --------------- subroutine ---------------
sub create_user{
    my ($name, $email) = @_;
    die "Name and Email required\n"
    unless $name && $email;

    my $sth = $dbh->prepare(
        "INSERT INTO users (name , email) VALUES(?,?) RETURNING id"
    );
    eval{
        $sth->execute($name , $email);
        my ($id) = $sth->fetchrow_array;
        print "User created successfully. ID: . $id\n";
    };
    if($@){
        if($@ =~ /duplicate key/){
            die "Email already exists.";
        }
        else{
            die $@;
        }
    }
    $sth->finish;
}

sub update_user{
    my ($id , $status) = @_;
    die "ID and STATUS Required\n"
    unless $id && $status;

    my $sth = $dbh->prepare(
        "UPDATE users SET status = ? WHERE id = ?"
    );

    my $rows = $sth->execute($status , $id);
    
    if($rows == 0){
        print "NO user found with ID $id\n";
    }else{
        print "User Updated Successfully\n";
    }
    $sth->finish;
}

sub delete_user{
    my ($id) = @_;
    die "ID Required\n"
    unless $id;


    my $sth = $dbh->prepare(
        "DELETE FROM users WHERE id = ?"
    );

    my $rows = $sth->execute($id);
    
    if($rows == 0){
        print "No user found with this $id\n";
    }else{
        print "User deleted Successfully\n";
    }

    $sth->finish;
}

sub list_user{
    my ($status) = @_;
    my $sth;

    if($status){
        $sth = $dbh->prepare(
            "SELECT id,name,email,status FROM users WHERE status = ?"
        );
        $sth->execute($status);
    }
    while(my $row = $sth->fetchrow_hashref){
        print "ID: $row->{id} , Name: $row->{name} , Email: $row->{email}, Status: $row->{status}\n";
    }
    $sth->finish;
}

sub report{
    my($type) = @_;

    if($type eq 'summary'){

    my $sth = $dbh->prepare(
        "SELECT status , COUNT(*) as total
        FROM users
        GROUP BY status"
    );

    $sth->execute;
    while(my $rows = $sth->fetchrow_hashref){
        print "Status: $rows->{status}, Count: $rows->{total}\n";
    }
    $sth->finish;
    }
    
    elsif($type eq 'latest'){
        my $sth = $dbh->prepare(
            "SELECT id,name,email,created_at
            FROM users
            ORDER BY created_at DESC
            LIMIT 5"
        );

        $sth->execute;
        while(my $rows = $sth->fetchrow_hashref){
            print "ID: $rows->{id}, Name: $rows->{name}, Created: $rows->{created_at}\n";
        }
        $sth->finish;
    }
    elsif ($type eq 'today') {

        my $sth = $dbh->prepare(
            "SELECT COUNT(*) 
             FROM users
             WHERE DATE(created_at) = CURRENT_DATE"
        );

        $sth->execute;

        my ($count) = $sth->fetchrow_array;

        print "Users created today: $count\n";

        $sth->finish;
    }

    else {
        print "Invalid report type\n";
    }
}