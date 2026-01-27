use strict;
use warnings;
use XML::LibXML;

=begin
1) load XML
2) List Student
3) Add new Student
4) update attribute
5) delete node
6) save XML
=END
=cut

main();

sub main{
    my $file = "FILE HANDLING/TEXT/studentInfo.xml";
    my $dom = load_xml_file($file);

    print "\n------LISTING THE STUDENT-------\n";
    list_student($dom);

    print "\n------ADDING NEW STUDENT-------\n";
    add_new_student($dom , '103' , "Raghav", 23, "C+");

    print "\n-------UPDATING STUDENT GRADE--------\n";
    update_student($dom , '101', "A+");

    print "\n--------DELETING STUDENT---------\n";
    delete_student($dom, '102');

    print "\n-------- SAVING THE FILE --------\n";
    save_xml_file($dom , 'finalStudentInfo.xml');

    print "\nDONE. CHECKOUT THE UDPATE STUDENT FILE\n";

}

sub load_xml_file{
    my($file) = @_;

    my $dom = XML::LibXML->load_xml(location => $file);
    return $dom;
}

sub list_student{
    my($dom) = @_;
    my @student = $dom->findnodes("//student");

    for my $s (@student){
        my $id = $s->getAttribute("id");
        my $name = $s->findvalue("./name");
        my $age = $s->findvalue("./age");
        my $grade = $s->findvalue("./grade");
        print "ID: $id | NAME: $name | AGE: $age | GRADE: $grade\n";
    } 
}


sub add_new_student{
    my ($dom , $id ,$name , $age, $grade) = @_;

    my $root = $dom->documentElement();

    my $student = XML::LibXML::Element->new('student');
    $student->setAttribute("id", $id);

    my $name_node = XML::LibXML::Element->new('name');
    $name_node->appendText($name);

    my $age_node = XML::LibXML::Element->new('age');
    $age_node->appendText($age);

    my $grade_node = XML::LibXML::Element->new('grade');
    $grade_node->appendText($grade);

    $student->appendChild($name_node);
    $student->appendChild($age_node);
    $student->appendChild($grade_node);

    $root->appendChild($student);
}

sub update_student{
    my ($dom , $id , $grade) = @_;
    my ($student) = $dom->findnodes("//student[\@id = '$id']");

    if($student){
        $student->setAttribute("grade", $grade);
        print "Grade Update for This $id->$grade\n";
    }else{
        print "Grade Not update for this $id\n";
    }
}

sub delete_student{
    my ($dom , $id) = @_;
    my ($student) = $dom->findnodes("//student[\@id = '$id']");

    if($student){
        my $parent = $student->parentNode();
        $parent->removeChild($student);
        print "STUDENT DETAILS IS DELETED\n";
    }else{
        print "CANT DELETE THIS STUDENT ID $id\n";
    }
}

sub save_xml_file{
    my($dom , $output) = @_;
    open my $fh , ">", $output or die "Cannot Write this file\n";
    print $fh $dom->toString(1);
    close $fh;
    print "SUCCESSFULLY SAVE IN XML\n";
}

# i learned file io in perl ,pretty much confident in handling txt csv amd json now i want to master parsing in XML files give me the cocepts to be cover and real time use case problem statement on the same














