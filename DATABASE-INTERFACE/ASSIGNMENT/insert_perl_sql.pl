use strict;
use warnings;
use DBI;


my $dsn = "DBI:Pg:dbname=assignment;host=localhost;port=5432";
my $user = "postgres";
my $pass = 'rahul';

my $dbh = DBI->connect(
    $dsn,$user,$pass,
    {
        RaiseError=>1,
        AutoCommit=>0,
    }
) or die "DATABASE CONNECTION IS FAILED: $DBI::errstr\n";
print "DATABASE connected successfully.\n";

eval{

    # DATA FOR SITES
    
 $dbh->do(q{
    INSERT INTO sites(site_name , location) VALUES
    ('Chennai Data Center', 'Chennai'),
    ('Delhi Operations Hub', 'Delhi'),
    ('Mumbai Tech Park', 'Mumbai'),
    ('Bangalore Innovation Campus', 'Bangalore'),
    ('Hyderabad Cloud Facility', 'Hyderabad'),
    ('Pune Research Center', 'Pune'),
    ('Kolkata Network Hub', 'Kolkata'),
    ('Ahmedabad Regional Office', 'Ahmedabad'),
    ('Jaipur Support Center', 'Jaipur'),
    ('Noida IT Park', 'Noida');
});

# DATA FOR ENGINNEERS

 $dbh->do(q{
INSERT INTO engineers (first_name, last_name, email, phone) VALUES
('Rahul','Singh','rahul.singh@company.com','9876543210'),
('Amit','Sharma','amit.sharma@company.com','9123456780'),
('Neha','Verma','neha.verma@company.com','9988776655'),
('Karan','Mehta','karan.mehta@company.com','9090909090'),
('Priya','Nair','priya.nair@company.com','9012345678'),
('Arjun','Reddy','arjun.reddy@company.com','9345678901'),
('Sneha','Kapoor','sneha.kapoor@company.com','9456123789'),
('Vikram','Joshi','vikram.joshi@company.com','9765432109'),
('Anjali','Desai','anjali.desai@company.com','9871234567'),
('Rohit','Malhotra','rohit.malhotra@company.com','9812345670'),
('Meera','Iyer','meera.iyer@company.com','9823456781'),
('Siddharth','Gupta','siddharth.gupta@company.com','9834567892'),
('Tanvi','Patel','tanvi.patel@company.com','9845678903'),
('Nikhil','Chopra','nikhil.chopra@company.com','9856789014'),
('Pooja','Agarwal','pooja.agarwal@company.com','9867890125'),
('Harsh','Bansal','harsh.bansal@company.com','9878901236'),
('Ishita','Roy','ishita.roy@company.com','9889012347'),
('Aditya','Kulkarni','aditya.kulkarni@company.com','9890123458'),
('Ritika','Saxena','ritika.saxena@company.com','9901234569'),
('Yash','Trivedi','yash.trivedi@company.com','9912345670'),
('Komal','Shah','komal.shah@company.com','9923456781'),
('Varun','Arora','varun.arora@company.com','9934567892'),
('Simran','Gill','simran.gill@company.com','9945678903'),
('Deepak','Mishra','deepak.mishra@company.com','9956789014'),
('Ayesha','Khan','ayesha.khan@company.com','9967890125');

 });

# DATA FOR DEVICES

$dbh->do(q{
INSERT INTO devices (device_name, model, serial_number, status, site_id, purchase_date) VALUES
('Router','RTX-900','SN1001','ACTIVE',1,'2024-01-10'),
('Switch','SWX-500','SN1002','FAULTY',2,'2023-08-20'),
('Firewall','FW-300','SN1003','ACTIVE',1,'2024-02-15'),
('Server','SVR-X1','SN1004','RETIRED',3,'2020-05-01'),
('Access Point','AP-AC200','SN1005','ACTIVE',2,'2024-03-12'),
('Router','RTX-901','SN1006','ACTIVE',4,'2024-01-22'),
('Switch','SWX-501','SN1007','ACTIVE',5,'2024-02-05'),
('Firewall','FW-301','SN1008','FAULTY',6,'2023-09-11'),
('Server','SVR-X2','SN1009','ACTIVE',7,'2024-03-02'),
('Access Point','AP-AC201','SN1010','ACTIVE',8,'2024-01-18'),

('Router','RTX-902','SN1011','ACTIVE',9,'2024-02-10'),
('Switch','SWX-502','SN1012','RETIRED',10,'2019-04-15'),
('Firewall','FW-302','SN1013','ACTIVE',3,'2024-01-30'),
('Server','SVR-X3','SN1014','ACTIVE',4,'2024-02-12'),
('Access Point','AP-AC202','SN1015','FAULTY',5,'2023-11-20'),
('Router','RTX-903','SN1016','ACTIVE',6,'2024-03-01'),
('Switch','SWX-503','SN1017','ACTIVE',7,'2024-02-14'),
('Firewall','FW-303','SN1018','ACTIVE',8,'2024-03-05'),
('Server','SVR-X4','SN1019','ACTIVE',9,'2024-02-28'),
('Access Point','AP-AC203','SN1020','ACTIVE',10,'2024-01-25'),

('Router','RTX-904','SN1021','ACTIVE',1,'2024-03-08'),
('Switch','SWX-504','SN1022','ACTIVE',2,'2024-02-18'),
('Firewall','FW-304','SN1023','ACTIVE',3,'2024-02-22'),
('Server','SVR-X5','SN1024','ACTIVE',4,'2024-03-09'),
('Access Point','AP-AC204','SN1025','ACTIVE',5,'2024-02-27'),
('Router','RTX-905','SN1026','ACTIVE',6,'2024-01-12'),
('Switch','SWX-505','SN1027','ACTIVE',7,'2024-02-19'),
('Firewall','FW-305','SN1028','ACTIVE',8,'2024-03-11'),
('Server','SVR-X6','SN1029','ACTIVE',9,'2024-03-03'),
('Access Point','AP-AC205','SN1030','ACTIVE',10,'2024-02-16'),

('Router','RTX-906','SN1031','ACTIVE',1,'2024-03-06'),
('Switch','SWX-506','SN1032','ACTIVE',2,'2024-02-21'),
('Firewall','FW-306','SN1033','ACTIVE',3,'2024-03-07'),
('Server','SVR-X7','SN1034','ACTIVE',4,'2024-02-25'),
('Access Point','AP-AC206','SN1035','ACTIVE',5,'2024-03-10'),
('Router','RTX-907','SN1036','ACTIVE',6,'2024-02-11'),
('Switch','SWX-507','SN1037','ACTIVE',7,'2024-03-04'),
('Firewall','FW-307','SN1038','ACTIVE',8,'2024-02-23'),
('Server','SVR-X8','SN1039','ACTIVE',9,'2024-03-01'),
('Access Point','AP-AC207','SN1040','ACTIVE',10,'2024-03-02'),

('Router','RTX-908','SN1041','ACTIVE',1,'2024-03-05'),
('Switch','SWX-508','SN1042','ACTIVE',2,'2024-03-06'),
('Firewall','FW-308','SN1043','ACTIVE',3,'2024-03-07'),
('Server','SVR-X9','SN1044','ACTIVE',4,'2024-03-08'),
('Access Point','AP-AC208','SN1045','ACTIVE',5,'2024-03-09'),
('Router','RTX-909','SN1046','ACTIVE',6,'2024-03-10'),
('Switch','SWX-509','SN1047','ACTIVE',7,'2024-03-11'),
('Firewall','FW-309','SN1048','ACTIVE',8,'2024-03-12'),
('Server','SVR-X10','SN1049','ACTIVE',9,'2024-03-13'),
('Access Point','AP-AC209','SN1050','ACTIVE',10,'2024-03-14'),

('Router','RTX-910','SN1051','ACTIVE',1,'2024-03-15'),
('Switch','SWX-510','SN1052','ACTIVE',2,'2024-03-16'),
('Firewall','FW-310','SN1053','ACTIVE',3,'2024-03-17'),
('Server','SVR-X11','SN1054','ACTIVE',4,'2024-03-18'),
('Access Point','AP-AC210','SN1055','ACTIVE',5,'2024-03-19'),
('Router','RTX-911','SN1056','ACTIVE',6,'2024-03-20'),
('Switch','SWX-511','SN1057','ACTIVE',7,'2024-03-21'),
('Firewall','FW-311','SN1058','ACTIVE',8,'2024-03-22'),
('Server','SVR-X12','SN1059','ACTIVE',9,'2024-03-23'),
('Access Point','AP-AC211','SN1060','ACTIVE',10,'2024-03-24');

});

# DATA FOR ALLOCATIONS

$dbh->do(q{
INSERT INTO allocations (engineer_id, device_id, allocation_date) VALUES
(1,1,'2024-04-01'),
(2,3,'2024-04-02'),
(3,5,'2024-04-03'),
(4,6,'2024-04-04'),
(5,7,'2024-04-05'),
(6,9,'2024-04-06'),
(7,11,'2024-04-07'),
(8,13,'2024-04-08'),
(9,14,'2024-04-09'),
(10,16,'2024-04-10'),
(11,17,'2024-04-11'),
(12,18,'2024-04-12'),
(13,19,'2024-04-13'),
(14,20,'2024-04-14'),
(15,21,'2024-04-15'),
(16,22,'2024-04-16'),
(17,23,'2024-04-17'),
(18,24,'2024-04-18'),
(19,25,'2024-04-19'),
(20,26,'2024-04-20'),
(21,27,'2024-04-21'),
(22,28,'2024-04-22'),
(23,29,'2024-04-23'),
(24,30,'2024-04-24'),
(25,31,'2024-04-25'),
(1,32,'2024-04-26'),
(2,33,'2024-04-27'),
(3,34,'2024-04-28'),
(4,35,'2024-04-29'),
(5,36,'2024-04-30'),
(6,37,'2024-05-01'),
(7,38,'2024-05-02'),
(8,39,'2024-05-03'),
(9,40,'2024-05-04'),
(10,41,'2024-05-05'),
(11,42,'2024-05-06'),
(12,43,'2024-05-07'),
(13,44,'2024-05-08'),
(14,45,'2024-05-09'),
(15,46,'2024-05-10');
});

$dbh->commit();
print "DATA Inserted Successfully.\n";
};

if($@){
    warn "Data Inserted Failed:\n";
    eval{$dbh->rollback};
}

$dbh->disconnect;
print "Disconnected.\n";