  $ $BIN/recordify --no-headers $TESTDIR/../input/test_with_headers.csv
  field1: header1
  field2: header2
  field3: header3
  field4: header4
  ---
  field1: value1
  field2: value2
  field3: 11.0
  field4: value4
  ---
  field1: r100value1
  field2: r100value2
  field3: 1123.00
  field4: r100value4
  ---
  field1: r3value1
  field2: r3value2
  field3: 300
  field4: r3value4
  ---
  field1: r4value1
  field2: r4value2 with "quotes"
  field3: 400
  field4: r4value4
  ---
  field1: r2value1
  field2: r2value2
  field3: 200
  field4: r2value4
