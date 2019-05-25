  $ $BIN/recordify --column header2 $TESTDIR/test_with_headers.csv
  value2
  r2value2
  $ $BIN/recordify --keep-headers --column header2 $TESTDIR/test_with_headers.csv
  header2
  value2
  r2value2
  $ $BIN/recordify --column 2 $TESTDIR/test_with_headers.csv
  Column to print 'field2' not found in headers! at /Users/jeremiahlee/projects/dotfiles/bin/recordify line 144, <> line 2.
  [25]
