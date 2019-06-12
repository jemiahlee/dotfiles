  $ cat $BIN/truncate | $BIN/truncate -l 15
  #!/usr/bin/perl..[0 more]
  
  =head1 NAME
  
      truncate - ..[65 more]
  
  =head1 SYNOPSIS..[0 more]
  
      truncate [o..[47 more]
  
      Options:
        --bare   ..[71 more]
        --length ..[81 more]
                 ..[82 more]
                 ..[28 more]
  
  =cut
  
  use warnings;
  use strict;
  
  use Getopt::Lon..[2 more]
  use Pod::Usage ..[14 more]
  
  my($bare, $line..[9 more]
  $line_length = ..[3 more]
  
  GetOptions(
             'bar..[29 more]
             'hel..[42 more]
             'lin..[36 more]
            );
  
  while (<>) {
  
      if (length(..[19 more]
          print;
  ..[-1 more]
          next;
      }
  
      my $leftove..[32 more]
      print subst..[23 more]
      print "..[$..[29 more]
      print "\n";..[0 more]
  }
  $ cat $BIN/truncate | $BIN/truncate -l 15 --bare
  #!/usr/bin/perl
  
  =head1 NAME
  
      truncate - 
  
  =head1 SYNOPSIS
  
      truncate [o
  
      Options:
        --bare   
        --length 
                 
                 
  
  =cut
  
  use warnings;
  use strict;
  
  use Getopt::Lon
  use Pod::Usage 
  
  my($bare, $line
  $line_length = 
  
  GetOptions(
             'bar
             'hel
             'lin
            );
  
  while (<>) {
  
      if (length(
          print;
  
          next;
      }
  
      my $leftove
      print subst
      print "..[$
      print "\n";
  }
