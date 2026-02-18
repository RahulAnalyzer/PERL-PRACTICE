use strict;
use warnings;
use DBI;


my $dsn = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
my $user = "postgres";
my $pass = 'rahul';

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError=>1,
        AutoCommit=>1
    }
)or die "Databas conncection failed\n";


# ----- CLI HANDLING-------

my $action = shift @ARGV or die "No command provided\n";

if($action eq 'create_order'){
    create_order(@ARGV);
}
elsif($action eq 'list_order'){
    list_order(@ARGV);
}
elsif($action eq 'summary'){
    summary();
}else{
    die "INVALID command\n";
}

$dbh->disconnect;


#========= CREATE ORDER (TRANSACTIONAL)=============

sub create_order{
    my ($customer_id , @items) = @_;
    
    die "Usage: create_order <customer_id> product_id:qty....\n"
    unless $customer_id && @items;

    eval{
        $dbh->{AutoCommit} = 0;

        #Insert Order

        my $sth = $dbh->prepare(
            "INSERT INTO orders (customer_id)
            VALUES (?)
            RETURNING id"
        );
        $sth->execute($customer_id);
        my ($order_id) = $sth->fetchrow_array;
        $sth->finish;

        #Insert items
        for my $item(@items){
            my ($product_id , $qty) = split /:/, $item;
            die "Invalid product formate\n"
            unless defined $product_id && defined $qty;

            my $sth2 = $dbh->prepare(
                "INSERT INTO order_items (order_id, product_id, quantity)
                 VALUES (?, ?, ?)"
            );

            $sth2->execute($order_id, $product_id, $qty);
            $sth2->finish;
        }
        $dbh->commit;
        print "Order created successfully. Order ID: $order_id\n";
    };
    if ($@) {
        print "Error occurred: $@\n";
        print "Rolling back transaction...\n";
        eval { $dbh->rollback };
    }

    $dbh->{AutoCommit} = 1;
}

# LIST ORDERS (JOIN)
# ==============================

sub list_order {

    my $sth = $dbh->prepare(q{
        SELECT o.id AS order_id,
               c.name AS customer,
               p.name AS product,
               oi.quantity
        FROM orders o
        JOIN customers c ON o.customer_id = c.id
        JOIN order_items oi ON o.id = oi.order_id
        JOIN products p ON oi.product_id = p.id
        ORDER BY o.id
    });

    $sth->execute;

    while (my $row = $sth->fetchrow_hashref) {
        print "Order $row->{order_id} | Customer: $row->{customer} | Product: $row->{product} | Qty: $row->{quantity}\n";
    }

    $sth->finish;
}

# SUMMARY REPORT
# ==============================

sub summary {

    my $sth = $dbh->prepare(q{
        SELECT o.id AS order_id,
               c.name AS customer,
               SUM(p.price * oi.quantity) AS total_amount
        FROM orders o
        JOIN customers c ON o.customer_id = c.id
        JOIN order_items oi ON o.id = oi.order_id
        JOIN products p ON oi.product_id = p.id
        GROUP BY o.id, c.name
        ORDER BY o.id
    });

    $sth->execute;

    while (my $row = $sth->fetchrow_hashref) {
        print "Order $row->{order_id} | Customer: $row->{customer} | Total: $row->{total_amount}\n";
    }

    $sth->finish;
}