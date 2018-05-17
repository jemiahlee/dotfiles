  $ $BIN/yes 1 | head -n 5
  1
  1
  1
  1
  1
  $ $BIN/yes 1 -e '$_ += 1' | head -n 5
  1
  2
  3
  4
  5
