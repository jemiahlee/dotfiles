  $ yes yes | head -n 5 | $BIN/append
  yes,
  yes,
  yes,
  yes,
  yes,
  $ yes yes | head -n 5 | $BIN/append '|'
  yes|
  yes|
  yes|
  yes|
  yes|
  $ yes yes | head -n 5 | $BIN/append '|' --start '78'
  78yes|
  78yes|
  78yes|
  78yes|
  78yes|
