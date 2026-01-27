
# list of list , list of dict

use strict;
use warnings;


my @a  = ("Name" , "Age" , "City");
my @b = (
    ["Rahul" , 21 , "Chandigarh"],
    ["Sujal" , 22 , "Punjab"],
    ["Raghav" ,21 , "Banur"],
    ["Sehajdeep", 21, "Mohali"],
    ["Kamalpreet", 22, "Rajpura"]
    
);

my @result;
for my $sub(@b){
    my %hash;
    @hash{@a} = @$sub; # hash slice assignment
    push @result, \%hash;
}
use Data::Dumper;
print Dumper(\@result);





# print "Data:\n";
# print "[\n";
# foreach my $hash_ref (@result) {
#     print "  {\n";
#     foreach my $key (@a) {
#         my $value = $hash_ref->{$key};
#         if ($value =~ /^\d+$/) {
#             print " '$key' => $value,\n";
#         } else {
#             print "  '$key' => '$value',\n";
#         }
#     }
#     print "  },\n";
# }
# print "];\n";