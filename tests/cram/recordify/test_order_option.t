  $ $BIN/recordify --order header2 $TESTDIR/test_with_headers.csv
  header1,header2,header3,header4
  r100value1,r100value2,1123.00,r100value4
  r2value1,r2value2,200,r2value4
  r3value1,r3value2,300,r3value4
  r4value1,r4value2,400,r4value4
  value1,value2,11.0,value4
  $ $BIN/recordify --keep-headers --order header2 $TESTDIR/test_with_headers.csv
  header1,header2,header3,header4
  r100value1,r100value2,1123.00,r100value4
  r2value1,r2value2,200,r2value4
  r3value1,r3value2,300,r3value4
  r4value1,r4value2,400,r4value4
  value1,value2,11.0,value4
  $ $BIN/recordify --order 2 $TESTDIR/test_with_headers.csv
  header1,header2,header3,header4
  r100value1,r100value2,1123.00,r100value4
  r2value1,r2value2,200,r2value4
  r3value1,r3value2,300,r3value4
  r4value1,r4value2,400,r4value4
  value1,value2,11.0,value4
  $ $BIN/recordify --order 3 $TESTDIR/test_with_headers.csv
  header1,header2,header3,header4
  value1,value2,11.0,value4
  r2value1,r2value2,200,r2value4
  r3value1,r3value2,300,r3value4
  r4value1,r4value2,400,r4value4
  r100value1,r100value2,1123.00,r100value4
