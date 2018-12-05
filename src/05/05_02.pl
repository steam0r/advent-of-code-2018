use strict;
use warnings;

my $filename = 'input';
my $file;
open($file, $filename) or die "failed to open $file";
my $polymer = <$file>;
close($file);

my $previousChar = "";
my $replacement;

my %letterUnits;
my $letterPolymer;

for my $letter ('a' ... 'z') {
    $previousChar = "";
    $letterPolymer = $polymer;
    $letterPolymer =~ s/$letter//gi;
    do {
        $replacement = 0;
        foreach my $char (split //, $letterPolymer) {
            if(($previousChar ne "") && ($previousChar ne $char)) {
                if($previousChar eq uc($char) || ($previousChar eq lc($char))) {
                    if($letterPolymer =~ /$previousChar$char/) {
                        $letterPolymer =~ s/$previousChar$char//g;
                        $replacement = 1;
                    }
                }
            }
            $previousChar = $char;
        }
    }while($replacement);
    $letterUnits{$letter} = length $letterPolymer;
}

foreach my $name (sort { $letterUnits{$a} <=> $letterUnits{$b} } keys %letterUnits) {
    printf "letter %s has %s remaining polymer units\n", $name, $letterUnits{$name};
    last;
}

exit;


