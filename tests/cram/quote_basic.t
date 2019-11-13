  $ yes yes | head -n 5 | $BIN/quote
  'yes'
  'yes'
  'yes'
  'yes'
  'yes'
  $ yes yes | head -n 5 | $BIN/quote --curly
  {yes}
  {yes}
  {yes}
  {yes}
  {yes}
  $ yes yes | head -n 5 | $BIN/quote --start BLAH --end HALB
  BLAHyesHALB
  BLAHyesHALB
  BLAHyesHALB
  BLAHyesHALB
  BLAHyesHALB
