  $ yes yes | head -n 5 | $BIN/prepend
  ,yes
  ,yes
  ,yes
  ,yes
  ,yes
  $ yes yes | head -n 5 | $BIN/prepend '|'
  |yes
  |yes
  |yes
  |yes
  |yes
  $ yes yes | head -n 5 | $BIN/prepend '|' --end '78'
  |yes78
  |yes78
  |yes78
  |yes78
  |yes78
