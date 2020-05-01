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
  $ yes yes | head -n 5 | $BIN/quote --start 'this: '
  this: yes
  this: yes
  this: yes
  this: yes
  this: yes
  $ yes yes | head -n 5 | $BIN/quote --end ' --> '
  yes --> 
  yes --> 
  yes --> 
  yes --> 
  yes --> 
