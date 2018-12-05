use strict;

my $filename = 'input';
my $file;
open($file, $filename) or die "failed to open $file";
my $polymer = <$file>;
close($file);

my $previousChar = "";
my $replacement;
do {
    $replacement = 0;
    foreach my $char (split //, $polymer) {
        if(($previousChar ne "") && ($previousChar ne $char)) {
            if($previousChar eq uc($char) || ($previousChar eq lc($char))) {
                if($polymer =~ /$previousChar$char/) {
                    $polymer =~ s/$previousChar$char//g;
                    $replacement = 1;
                }
            }
        }
        $previousChar = $char;
    }
}while($replacement);

print "After fully reacting the polymer ";
print length $polymer;
print " units remain.";
print "\n";
