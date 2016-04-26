(*test:
$ sml
- use "sorting/bubbleSort.sml";
- bubbleSort [10,20,2,3,7,8,101,80,81]*);

fun bubble []  = []
  | bubble [a] = [a]
  | bubble (a :: b :: xs) =
      if a <= b then a :: bubble (b :: xs)
                else b :: bubble (a :: xs)

fun bubbleSort []        = []
  | bubbleSort (x :: xs) = bubble (x :: bubbleSort xs)
