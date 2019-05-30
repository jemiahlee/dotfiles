  $ $BIN/recordify --sum header3 $TESTDIR/test_with_headers.csv
  1000
  $ $BIN/recordify --sum 3 $TESTDIR/test_with_headers.csv
  1000
  $ $BIN/recordify --sum field3 $TESTDIR/test_without_headers.csv
  1000
  $ $BIN/recordify --sum header3 --keep $TESTDIR/test_with_headers.csv
  header3
  1000
