  $ $BIN/recordify --help
  Usage:
          recordify [options] <filename>
  
          This script will output a CSV in a one-line-per-column format, or allow
          you to write Perl code to evaluate for each line.
  
          It will look at whether the first line's fields have any lower- or
          uppercase letters; if it does not, it will assume that it is not a
          header line.
  
           Options:
             --column            Give a number or field name, print only this column.
             --delimiter         Provide delimiter in the file. A comma is the default.
             --execute           Provide Perl code that operates on %_ where the keys
                                 are the keys in the header, which will be evaluated
                                 each line. (@_ is also available, awk-style)
             --keep-headers      Print the header line out before any output. This is
                                 useful if you are just filtering the CSV somehow.
             --no-headers        Force the first line to be treated as a data line
                                 instead of a header line.
             --order             Instead of printing by record, just sort the file by
                                 the field specified. Automatically turns on --keep.
             --sum               Sum a particular column, the column name should be given
                                 as an argument to this option.
             --template          Process the filename given as the template using a simple
                                 handlebar-style template. The template will be rendered
                                 once per record.
  
                                 Example template:
                                 This is {{column1}}'s value and {{column2}}'s.
  
             --verbose           Print files separated by spaces instead of newlines.
  
          One note about this script's behavior: it is not particularly intelligent
          about embedded delimiters in the CSV. It looks only for quoted portions of
          the record and avoids splitting fields that are surrounded entirely by
          double quotes ("). You may need to pre-process the CSV if this is
          insufficient.
  
  [2]







  $ $BIN/recordify -?
  Usage:
          recordify [options] <filename>
  
          This script will output a CSV in a one-line-per-column format, or allow
          you to write Perl code to evaluate for each line.
  
          It will look at whether the first line's fields have any lower- or
          uppercase letters; if it does not, it will assume that it is not a
          header line.
  
           Options:
             --column            Give a number or field name, print only this column.
             --delimiter         Provide delimiter in the file. A comma is the default.
             --execute           Provide Perl code that operates on %_ where the keys
                                 are the keys in the header, which will be evaluated
                                 each line. (@_ is also available, awk-style)
             --keep-headers      Print the header line out before any output. This is
                                 useful if you are just filtering the CSV somehow.
             --no-headers        Force the first line to be treated as a data line
                                 instead of a header line.
             --order             Instead of printing by record, just sort the file by
                                 the field specified. Automatically turns on --keep.
             --sum               Sum a particular column, the column name should be given
                                 as an argument to this option.
             --template          Process the filename given as the template using a simple
                                 handlebar-style template. The template will be rendered
                                 once per record.
  
                                 Example template:
                                 This is {{column1}}'s value and {{column2}}'s.
  
             --verbose           Print files separated by spaces instead of newlines.
  
          One note about this script's behavior: it is not particularly intelligent
          about embedded delimiters in the CSV. It looks only for quoted portions of
          the record and avoids splitting fields that are surrounded entirely by
          double quotes ("). You may need to pre-process the CSV if this is
          insufficient.
  
  [2]







