  $ echo "blah\n1\n3\n4\nyes" | $BIN/sum
  8
  $ echo "blah\n00:00\n-3\n4\n+32.32\nyes" | $BIN/sum
  33.32
  $ echo "blah\n00:00\n-3\n\n4\n+32.32\nyes" | $BIN/sum
  33.32
  $ echo "32,333\n1,222\n-3\n\n4\n+32.32\nyes" | $BIN/sum
  33588.32
