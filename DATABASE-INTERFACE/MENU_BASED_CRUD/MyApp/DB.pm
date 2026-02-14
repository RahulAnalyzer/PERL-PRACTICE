package MyApp::DB;
print "MyApp::DB loaded\n";


use strict;
use warnings;
use DBI;

sub new{
    my($class) = @_;
    my $dsn ="DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
    my $user = "postgres";
    my $pass = 'rahul';

    my $dbh = DBI->connect(
        $dsn , $user , $pass ,{
            RaiseError =>1,
            AutoCommit => 1
        }
    );

    my $self = {
        dbh => $dbh
    };

    bless $self , $class;
    return $self;
}

sub create_user{
    my ($self , $data) = @_;
    my $sth = $self->{dbh}->prepare(q{
        INSERT INTO jsondetail (id , firstName , lastName , age , gender ,email )
        VALUES (?,?,?,?,?,?)
        ON CONFLICT (id) DO NOTHING
    });

    $sth->execute(
        $data->{id},
        $data->{firstName},
        $data->{lastName},
        $data->{age},
        $data->{gender},
        $data->{email},
    );

    $sth->finish;
}
sub read_user {

    my ($self, $id) = @_;

    my $sth = $self->{dbh}->prepare(
        "SELECT * FROM jsondetail WHERE id = ?"
    );

    $sth->execute($id);

    my $row = $sth->fetchrow_hashref;

    $sth->finish;

    return $row;
}

sub update_user{
    my ($self , $id , $age) = @_;
    my $sth = $self->{dbh}->prepare(
        "UPDATE jsondetail SET age = ? WHERE id = ?"
    );
    my $rows = $sth->execute($age , $id);
    $sth->finish;

    return $rows
}

sub delete_user{
    my ($self , $id) = @_;
    my $sth = $self->{dbh}->prepare(
        "DELETE FROM jsondetail WHERE id = ?"
    );

    my $rows = $sth->execute($id);
    return $rows;

}

sub list_users{
    my ($self) = @_;
    my $sth = $self->{dbh}->prepare(
        "SELECT id , firstName , lastName , age , gender , email FROM jsondetail ORDER by id"
    );

    $sth->execute;
    my $rows = $sth->fetchall_arrayref({});
    $sth->finish;
    return $rows;
}

sub DESTROY{
    my ($self) = @_;
    if($self->{dbh}){
        $self->{dbh}->disconnect;
    }
}
1;