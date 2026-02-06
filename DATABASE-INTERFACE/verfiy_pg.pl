# use strict;
# use warnings;
# use DBI;

# my $dsn  = "DBI:Pg:dbname=perl_dbi;host=localhost;port=5432";
# my $user = "postgres";
# my $pass = "rahul";

# my $dbh = DBI->connect(
#     $dsn,
#     $user,
#     $pass,
#     { RaiseError => 1, AutoCommit => 0 }
# );

# eval {

#     print "Current employee IDs:\n";

#     my $select_sth = $dbh->prepare(
#         "SELECT emp_id, name FROM employee ORDER BY emp_id"
#     );
#     $select_sth->execute;

#     while (my ($id, $name) = $select_sth->fetchrow_array) {
#         print "  emp_id: $id, name: $name\n";
#     }
#     $select_sth->finish;

#     # 1. Drop default and primary key
#     $dbh->do(q{
#         ALTER TABLE employee
#         ALTER COLUMN emp_id DROP DEFAULT
#     });

#     $dbh->do(q{
#         ALTER TABLE employee
#         DROP CONSTRAINT employee_pkey
#     });

#     # 2. Renumber using CTE (VALID SQL)
#     $dbh->do(q{
#         WITH ordered AS (
#             SELECT emp_id,
#                    ROW_NUMBER() OVER (ORDER BY emp_id) AS new_id
#             FROM employee
#         )
#         UPDATE employee e
#         SET emp_id = o.new_id
#         FROM ordered o
#         WHERE e.emp_id = o.emp_id
#     });

#     # 3. Restore primary key
#     $dbh->do(q{
#         ALTER TABLE employee
#         ADD PRIMARY KEY (emp_id)
#     });

#     # 4. Reset sequence correctly
#     my ($max_id) = $dbh->selectrow_array(
#         "SELECT MAX(emp_id) FROM employee"
#     );

#     $dbh->do(
#         "ALTER SEQUENCE employee_emp_id_seq RESTART WITH " . ($max_id + 1)
#     );

#     $dbh->do(q{
#         ALTER TABLE employee
#         ALTER COLUMN emp_id
#         SET DEFAULT nextval('employee_emp_id_seq')
#     });

#     $dbh->commit;

#     print "\nUpdated employee IDs:\n";

#     $select_sth = $dbh->prepare(
#         "SELECT emp_id, name FROM employee ORDER BY emp_id"
#     );
#     $select_sth->execute;

#     while (my ($id, $name) = $select_sth->fetchrow_array) {
#         print "  emp_id: $id, name: $name\n";
#     }
#     $select_sth->finish;

#     print "\nSuccess! Employee IDs are now sequential.\n";
# };

# if ($@) {
#     warn "Error: $@";
#     eval { $dbh->rollback };
#     print "All changes rolled back due to error.\n";
# }

# $dbh->disconnect;
