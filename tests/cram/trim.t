  $ $BIN/trim $BIN/trim
  #!/usr/bin/perl=head1 NAMEtrim - trim whitespace from the front and end of strings=head1 SYNOPSIStrim [options] [arg1 arg2 ...]trim [options] < <filename>This script will remove whitespace from files as command-line args or from STDIN.Options:--keep-newlines      Do not remove newlines.--no-newlines=cutuse warnings;use strict;use Getopt::Long;use Pod::Usage qw/pod2usage/;my $keep_newlines = 0;GetOptions('help|?'         => sub { pod2usage(); },'keep-newlines'  => \$keep_newlines,'no-newlines'    => sub { $keep_newlines = 0; },);while(<>){chomp;s/^\s+|\s+$//g;print;print "\n" if $keep_newlines;} (no-eol)
