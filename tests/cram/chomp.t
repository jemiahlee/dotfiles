  $ cat $TESTDIR/changemaker_input.txt | $BIN/chomp
  $10.00
  $10.00
  $9.00
  $15.00
  $20.00
  $10.00
  $10.00
  $10.00
  $35.00
  $20.00
  $5.00
  $15.00
  $50.00
  $5.00
  $5.00
  $5.00
  $10.00
  $15.00
  $7.00
  63
  49
  79
  $ $BIN/chomp --help
  Usage:
          chomp [--help|-?] [filename [filename2...]]
          chomp [--help|-?] < filename
  
          This script will remove empty lines from input on STDIN or
          from a file list.
  
  [2]
  $ $BIN/chomp -?
  Usage:
          chomp [--help|-?] [filename [filename2...]]
          chomp [--help|-?] < filename
  
          This script will remove empty lines from input on STDIN or
          from a file list.
  
  [2]
