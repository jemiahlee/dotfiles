  $ $BIN/recordify --column header2 --execute 'blah' $TESTDIR/test_with_headers.csv
  Incompatible command-line switches at [\w/]+/bin/recordify line \d+. (re)
  [255]
  $ $BIN/recordify --order 1 --execute '' --column header2 $TESTDIR/test_with_headers.csv
  Incompatible command-line switches at [\w/]+/bin/recordify line \d+. (re)
  [255]
  $ $BIN/recordify --column 2 --execute '' $TESTDIR/test_with_headers.csv
  Incompatible command-line switches at [\w/]+/bin/recordify line \d+. (re)
  [255]
  $ $BIN/recordify --template 'blah' --order 1 --execute '' $TESTDIR/test_with_headers.csv
  Incompatible command-line switches at [\w/]+/bin/recordify line \d+. (re)
  [255]
  $ $BIN/recordify --sum 2 --order 1 --execute '' $TESTDIR/test_with_headers.csv
  Incompatible command-line switches at [\w/]+bin/recordify line \d+. (re)
  [255]
