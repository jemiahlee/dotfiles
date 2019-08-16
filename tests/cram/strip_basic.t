  $ echo "\tblah  \t" | $BIN/strip
  blah
  $ echo "\t   \tblah " | $BIN/strip
  blah
  $ echo "\t   blah  \t\t\t" | $BIN/strip
  blah
  $ echo "\t ,  blah  \t\t\t," | $BIN/strip
  blah
  $ echo "\t   bl   ah  \t\t\t" | $BIN/strip
  bl   ah
  $ echo "\t   blah  \t,\t\t" | $BIN/strip
  blah
