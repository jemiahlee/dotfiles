  $ $BIN/recordify -e 'print "$_[0]\n"' $TESTDIR/test_with_headers.csv
  value1
  r2value1
  $ $BIN/recordify -e 'print "$_{header1}\n"' $TESTDIR/test_with_headers.csv
  value1
  r2value1
