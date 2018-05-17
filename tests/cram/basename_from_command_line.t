  $ $BIN/basename /blah/blah1/blah2/blah.txt
  blah.txt
  $ $BIN/basename --depth 2 /blah/blah1/blah2/blah.txt
  blah2
  $ $BIN/basename --depth 3 /blah/blah1/blah2/blah.txt
  blah1
  $ $BIN/basename --depth 4 /blah/blah1/blah2/blah.txt
  blah
