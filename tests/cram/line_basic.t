  $ $BIN/line 24 $BIN/line
  use strict;
  $ $BIN/line --numbers 24 $BIN/line
  24: use strict;
  $ $BIN/line --numbers --no 24 30 $BIN/line
  24: use strict;
  25: 
  26: use Getopt::Long;
  27: use Pod::Usage qw/pod2usage/;
  28: 
  29: my $print_numbers = 1;
  30: my $force_print_numbers;
  $ $BIN/line --no 24 30 $BIN/line
  use strict;
  
  use Getopt::Long;
  use Pod::Usage qw/pod2usage/;
  
  my $print_numbers = 1;
  my $force_print_numbers;
  $ $BIN/line 56 END $BIN/line
  56: my $printed = 0;
  57: while( <> ) {
  58:     if( $. >= $min and ($max eq 'END' or $. <= $max) ) {
  59:         print "$.: " if $print_numbers;
  60:         print $_;
  61:         $printed = 1;
  62:     }
  63: 
  64:     unless( $max eq 'END' ){
  65:         last if $. >= $max;
  66:     }
  67: }
  68: 
  69: print "Your file did not have that many lines!\n" unless $printed;
  $ $BIN/line --no 56 END $BIN/line
  my $printed = 0;
  while( <> ) {
      if( $. >= $min and ($max eq 'END' or $. <= $max) ) {
          print "$.: " if $print_numbers;
          print $_;
          $printed = 1;
      }
  
      unless( $max eq 'END' ){
          last if $. >= $max;
      }
  }
  
  print "Your file did not have that many lines!\n" unless $printed;
  $ $BIN/line 100 END $BIN/line
  Your file did not have that many lines!
  $ $BIN/line --no 100 END $BIN/line
  Your file did not have that many lines!
