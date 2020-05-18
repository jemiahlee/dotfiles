  $ $BIN/recordify --sum header3 $TESTDIR/../input/test_with_headers.csv
  2034
  $ $BIN/recordify --sum 3 $TESTDIR/../input/test_with_headers.csv
  2034
  $ $BIN/recordify --sum field3 $TESTDIR/../input/test_without_headers.csv
  1000
  $ $BIN/recordify --sum header3 --keep $TESTDIR/../input/test_with_headers.csv
  header3
  2034
