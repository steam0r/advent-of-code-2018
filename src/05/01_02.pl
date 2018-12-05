use strict;

my $filename = 'input';
my $file;
open($file, $filename) or die "failed to open $file";
my $polymer = <$file>;
close($file);
