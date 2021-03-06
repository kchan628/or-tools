************************************************************************
file with basedata            : cr339_.bas
initial value random generator: 12058
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  136
RESOURCES
  - renewable                 :  3   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       22        1       22
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          2           5  10
   3        3          3           6   8  12
   4        3          3           7   9  12
   5        3          3           6   7  11
   6        3          3          13  15  17
   7        3          3          15  16  17
   8        3          1           9
   9        3          2          10  11
  10        3          2          14  17
  11        3          1          13
  12        3          2          14  15
  13        3          1          14
  14        3          1          16
  15        3          1          18
  16        3          1          18
  17        3          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  R 3  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0    0
  2      1     6       4    8    8    9    5
         2     8       4    7    5    9    4
         3    10       2    2    5    8    3
  3      1     2       8    9    8    7    9
         2     8       7    7    7    6    6
         3     9       5    6    6    6    4
  4      1     2       4    5    1    5    4
         2     8       3    5    1    4    4
         3     9       3    4    1    4    4
  5      1     1       7    6    9    5    1
         2     2       5    6    6    4    1
         3    10       2    4    3    4    1
  6      1     1       2    5    7   10    3
         2     3       2    5    5   10    3
         3     8       2    4    5    9    3
  7      1     2       5   10    4    3    9
         2    10       3    8    4    3    5
         3    10       2    9    4    2    5
  8      1     4       8    5    7    6    4
         2     6       5    4    7    5    4
         3     7       1    4    6    5    3
  9      1     4       5    8    2    7    4
         2     8       5    6    2    7    3
         3     9       4    2    1    5    3
 10      1     3       3    7    7    4    7
         2     6       2    7    6    3    5
         3     8       1    5    6    2    1
 11      1     1       7    7    6    8    3
         2     5       5    5    4    5    2
         3    10       2    2    1    3    2
 12      1     3       4    8    8    8    8
         2     4       3    7    6    6    6
         3     8       2    6    6    5    5
 13      1     1      10    4    2   10    6
         2     5       7    4    2    8    5
         3     9       4    3    2    7    5
 14      1     5       5    9    8    5    6
         2     8       4    9    7    4    6
         3    10       3    9    7    4    5
 15      1     3       6    9   10    9    8
         2     4       6    9    7    7    7
         3     6       5    9    2    6    6
 16      1     4      10    9    9    7    8
         2     9       9    8    8    6    6
         3    10       9    8    6    6    3
 17      1     1       5    3    7    8    6
         2     2       5    3    4    7    5
         3     3       3    2    2    6    3
 18      1     0       0    0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  R 3  N 1  N 2
   17   20   19   89   65
************************************************************************
