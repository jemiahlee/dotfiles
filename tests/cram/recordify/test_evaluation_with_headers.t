  $ $BIN/recordify -e 'print "$_[0]\n"' $TESTDIR/../input/test_with_headers.csv
  value1
  r100value1
  r3value1
  r4value1
  r2value1
  $ $BIN/recordify -e 'print "$_{header1}\n"' $TESTDIR/../input/test_with_headers.csv
  value1
  r100value1
  r3value1
  r4value1
  r2value1
