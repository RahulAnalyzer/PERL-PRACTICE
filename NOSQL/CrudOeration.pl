use strict;
use warnings;
use MongoDB;
use BSON qw( bson_oid );
use Data::Dumper;

# ============================
# CONNECTION
# ============================

my $client = MongoDB->connect("mongodb://localhost:27017");

my $db = $client->get_database("engineering_nosql");
my $collection = $db->get_collection("engineers");

print "\nConnected to MongoDB successfully.\n";

# Create index on email (unique)
$collection->indexes->create_one(
    [ email => 1 ],
    { unique => 1 }
);

# ============================
# CREATE
# ============================

sub create_engineer {

    print "Name: ";
    chomp(my $name = <STDIN>);

    print "Email: ";
    chomp(my $email = <STDIN>);

    print "Experience (years): ";
    chomp(my $exp = <STDIN>);

    my $result = eval {
        $collection->insert_one({
            name       => $name,
            email      => $email,
            experience => int($exp),
            devices    => [],
            created_at => time()
        });
    };

    if ($@) {
        print "Insert failed (maybe duplicate email).\n";
    } else {
        print "Engineer inserted successfully.\n";
    }
}

# ============================
# READ (ALL)
# ============================

sub read_all {

    print "\n--- ALL ENGINEERS ---\n";

    my $cursor = $collection->find({});

    while (my $doc = $cursor->next) {
        print "ID: ", $doc->{_id}, "\n";
        print "Name: $doc->{name}\n";
        print "Email: $doc->{email}\n";
        print "Experience: $doc->{experience}\n";
        print "-------------------------\n";
    }
}

# ============================
# READ (FILTER)
# ============================

sub read_by_experience {

    print "Minimum experience: ";
    chomp(my $min = <STDIN>);

    my $cursor = $collection->find({
        experience => { '$gte' => int($min) }
    });

    print "\nEngineers with >= $min years experience:\n";

    while (my $doc = $cursor->next) {
        print "$doc->{name} ($doc->{experience} years)\n";
    }
}

# ============================
# UPDATE
# ============================

sub update_engineer {

    print "Enter Email to update: ";
    chomp(my $email = <STDIN>);

    print "New Experience: ";
    chomp(my $exp = <STDIN>);

    my $result = $collection->update_one(
        { email => $email },
        { '$set' => { experience => int($exp) } }
    );

    if ($result->matched_count) {
        print "Update successful.\n";
    } else {
        print "No matching record found.\n";
    }
}

# ============================
# DELETE
# ============================

sub delete_engineer {

    print "Enter Email to delete: ";
    chomp(my $email = <STDIN>);

    my $result = $collection->delete_one({ email => $email });

    if ($result->deleted_count) {
        print "Delete successful.\n";
    } else {
        print "No matching record found.\n";
    }
}

# ============================
# MENU
# ============================

sub menu {

    while (1) {

        print "\n====== MONGO CRUD MENU ======\n";
        print "1. Create Engineer\n";
        print "2. View All Engineers\n";
        print "3. View by Experience\n";
        print "4. Update Engineer\n";
        print "5. Delete Engineer\n";
        print "6. Exit\n";
        print "Choice: ";

        chomp(my $choice = <STDIN>);

        if ($choice == 1) {
            create_engineer();
        }
        elsif ($choice == 2) {
            read_all();
        }
        elsif ($choice == 3) {
            read_by_experience();
        }
        elsif ($choice == 4) {
            update_engineer();
        }
        elsif ($choice == 5) {
            delete_engineer();
        }
        elsif ($choice == 6) {
            last;
        }
        else {
            print "Invalid option.\n";
        }
    }
}

menu();

print "\nDisconnected from MongoDB.\n";