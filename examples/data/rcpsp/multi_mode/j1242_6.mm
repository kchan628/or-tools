************************************************************************
file with basedata            : md106_.bas
initial value random generator: 1671020512
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  14
horizon                       :  94
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     12      0       21        4       21
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3           5   6  13
   3        3          3           5   6  13
   4        3          3           5   6   7
   5        3          3           8   9  11
   6        3          2          11  12
   7        3          3           8  10  11
   8        3          1          12
   9        3          1          10
  10        3          1          12
  11        3          1          14
  12        3          1          14
  13        3          1          14
  14        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     6       0    3    3    4
         2     8       8    0    2    3
         3     9       8    0    1    2
  3      1     2       0    7    3    2
         2     9       0    4    2    2
         3    10       0    2    2    2
  4      1     1       0    9   10    9
         2     3       2    0    9    7
         3     5       0    7    9    4
  5      1     5       8    0    7    9
         2     8       0    2    6    5
         3    10       4    0    3    4
  6      1     7      10    0    7    5
         2     8       0    5    7    4
         3     9       7    0    7    2
  7      1     2       5    0    4    4
         2     2       4    0    6    4
         3     3       0    8    2    2
  8      1     6       0    5    8    7
         2     9       0    1    8    5
         3    10       2    0    6    2
  9      1     6       0    8    4    5
         2     7       0    6    3    3
         3     7       1    0    4    3
 10      1     1       5    0    6    9
         2     4       1    0    5    5
         3     7       0    3    2    2
 11      1     1       6    0    8    5
         2     4       0    5    7    3
         3     4       3    0    4    2
 12      1     3       4    0    8    5
         2     6       4    0    5    4
         3    10       0    7    5    3
 13      1     1       0    8   10    6
         2     6       7    0    7    5
         3    10       0    2    4    5
 14      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   13   11   64   52
************************************************************************