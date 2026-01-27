use strict;
use warnings;
use XML::LibXML;
use JSON;

main();

sub main{
    my $xml_file = "C:\Users\LEGION\OneDrive\Desktop\PERL PROGRAMMING\finalStudentInfo.xml"
    my $json_file = "Json_file.json";

    convert_xml_to_json($xml_file, $json_file);

}

sub convert_xml_to_json{
    my($xml_file, $json_file) = @_;

    # xml setup 
    my $dom = XML::LibXML->load_xml(location => $xml_file);

    # fetch student details

    my @student = $dom->findnodes("//student");
    my @data;

    for my $s (@student){
        my %student_record;

        my $id = $s->getAttribute("id");
        my $name = $s->findvalue("./name");
        my $age = $s->findvalue("./age");
        my $grade = $s->findvalue("./grade");

        push @data , \%student;

    }

    # convert xml to json 
    my $json_text = to_json(\@data, {pretty => 1});

    #save json
    open my $fh, '>', $json_file or die "Cannot write this file:$!";
    print $fh $json_text;
    close $fh;


    print "\nXML TO JSON SUUCCESSFULLY CONVERTED\n";
}