  $ $BIN/recordify --column header2 $TESTDIR/../input/test_with_headers.csv
  value2
  r100value2
  r3value2
  r4value2 with "quotes"
  r2value2
  $ $BIN/recordify --keep-headers --column header2 $TESTDIR/../input/test_with_headers.csv
  header2
  value2
  r100value2
  r3value2
  r4value2 with "quotes"
  r2value2
  $ $BIN/recordify --column 2 $TESTDIR/../input/test_with_headers.csv
  value2
  r100value2
  r3value2
  r4value2 with "quotes"
  r2value2
