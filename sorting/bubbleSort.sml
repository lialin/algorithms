fun bubble [] = []
  | bubble [a] = [a]
  | bubble (a :: b :: xs) =
      if a <= b then a :: bubble (b :: xs)
                else b :: bubble (a :: xs)

fun bubbleSort [] = []
  | bubbleSort (x :: xs) = bubble (x :: bubbleSort xs)
