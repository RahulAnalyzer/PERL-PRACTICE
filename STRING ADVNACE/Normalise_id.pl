<<<<<<< HEAD
use strict;
use warnings;

sub Normalizes_id{
    my @ids = @_;
    my @result;
    foreach my $id(@ids){
        if($id =~ /prod[-_]?(\d{3})/i){
            push @result, "PROD-" . $1;
        }else{
            warn "Invalid ID: $id\n";
        }
        
    }
    return @result;
}

print "ENTER PROUCT IDS: ";
my $input = <STDIN>;
chomp($input);

my @ids = split(/\s+/, $input);
my @Normalizes_id = Normalizes_id(@ids);
=======
use strict;
use warnings;

sub Normalizes_id{
    my @ids = @_;
    my @result;
    foreach my $id(@ids){
        if($id =~ /prod[-_]?(\d{3})/i){
            push @result, "PROD-" . $1;
        }else{
            warn "Invalid ID: $id\n";
        }
        
    }
    return @result;
}

print "ENTER PROUCT IDS: ";
my $input = <STDIN>;
chomp($input);

my @ids = split(/\s+/, $input);
my @Normalizes_id = Normalizes_id(@ids);
>>>>>>> master
print "Normalizes Id: ", join(", ", @Normalizes_id), "\n";