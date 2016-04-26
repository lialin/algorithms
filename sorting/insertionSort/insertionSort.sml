(*Author: Liang LIn
Email:
Date: 2016-04-26*)

(*Test:
- use "insertionSort.sml"
- insertionSort (op <=) [2,4,3,7,6];
val it = [2,3,4,6,7] : int list
- insertionSort (op >) [2,6,4,1,7,5,9,12,10];
val it = [12,10,9,7,6,5,4,2,1] : int list*)

fun insertionSort (op <=) =
  let
    fun insert (x, []) = [x]
      | insert (x, y::ys) =
          if x <= y then x :: y :: ys
                    else y :: insert (x, ys)

    fun sort [] = []
      | sort (x :: xs) = insert (x, sort xs)
  in
    sort
  end
