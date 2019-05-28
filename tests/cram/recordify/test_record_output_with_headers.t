  $ $BIN/recordify $TESTDIR/test_with_headers.csv
  header1: value1
  header2: value2
  header3: 100
  header4: value4
  ---
  header1: r3value1
  header2: r3value2
  header3: 300
  header4: r3value4
  ---
  header1: r4value1
  header2: r4value2
  header3: 400
  header4: r4value4
  ---
  header1: r2value1
  header2: r2value2
  header3: 200
  header4: r2value4
  $ $BIN/recordify --keep-headers -e 'print $_, "\n";' $TESTDIR/test_with_headers.csv
  header1,header2,header3,header4
  value1,value2,100,value4
  r3value1,r3value2,300,r3value4
  r4value1,r4value2,400,r4value4
  r2value1,r2value2,200,r2value4
