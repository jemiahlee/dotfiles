  $ rename -n 'hi' 'bye' hifile.txt byefile.txt
  NOT! Moving hifile.txt to byefile.txt
  $ rename -n --verbose 'hi' 'bye' hifile.txt byefile.txt
  pattern received was 'hi'
  replacement received was 'bye'
  
  hifile.txt matches
  NOT! Moving hifile.txt to byefile.txt
  byefile.txt: No modification necessary
  $ rename -n -g 'hi' 'bye' hifilhie.txt byehifile.txt other.txt
  NOT! Moving hifilhie.txt to byefilbyee.txt
  NOT! Moving byehifile.txt to byebyefile.txt
  $ rename -n -e '(?<=file)(\d{1,2})(?=.txt)' 'length($1) == 2 ? qq{0$1} : qq{00$1}' file1.txt file10.txt file100.txt
  NOT! Moving file1.txt to file001.txt
  NOT! Moving file10.txt to file010.txt
  $ rename -n -e --verbose '(?<=file)(\d{1,2})(?=.txt)' 'length($1) == 2 ? qq{0$1} : qq{00$1}' file1.txt file10.txt file100.txt
  pattern received was '(?<=file)(\d{1,2})(?=.txt)'
  replacement received was 'length($1) == 2 ? qq{0$1} : qq{00$1}'
  
  file1.txt matches
  NOT! Moving file1.txt to file001.txt
  file10.txt matches
  NOT! Moving file10.txt to file010.txt
  file100.txt: No modification necessary
