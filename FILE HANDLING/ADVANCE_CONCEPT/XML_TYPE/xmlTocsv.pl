use strict;
use warnings;
use XML::LibXML;
use Text::CSV;

main();
sub main{
    my $xml_file = "C:/Users/LEGION/OneDrive/Desktop/PERL PROGRAMMING/finalStudentInfo.xml";
    my $csv_file = "Xml-To-Csv_file.csv";

    convert_xml_to_csv($xml_file, $csv_file);
}

sub convert_xml_to_csv{
    my($xml_file , $csv_file) = @_;

    #load the XML file first
    my $dom = XML::LibXML->load_xml(location => $xml_file);

    #fetch / list all the student
    my @student = $dom->findnodes("//student");

    #csv Setup 

    my $csv = Text::CSV->new({binary => 1 , auto_diag => 1});
    open my $fh, '>', $csv_file or die "Cannot write on this File:$!";
    
    #write header
    $csv->say($fh, ["id" , "name", "age", "grade"]);

    #write rows
    for my $s (@student){
        my $id = $s->getAttribute("id");
        my $name = $s->findvalue("./name");
        my $age = $s->findvalue("./age");
        my $grade = $s->findvalue("./grade");

        $csv->say($fh, [$id , $name , $age , $grade]);
    }
    close $fh;
    print "\n XML TO CSV CONVERSION IS SUCCESSFULLY DONE\n";
}



