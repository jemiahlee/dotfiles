  $ echo "This is a long line that will be truncated!" | $BIN/truncate -l 15
  This is a long ..[28 more]
  $ echo "This is a long line that will be truncated!" | $BIN/truncate --length 15
  This is a long ..[28 more]
  $ echo "This is a long line that will be truncated!" | $BIN/truncate --line_length 15
  This is a long ..[28 more]
  $ echo "This is a long line that will be truncated!" | $BIN/truncate --line_length 15 --bare
  This is a long 
