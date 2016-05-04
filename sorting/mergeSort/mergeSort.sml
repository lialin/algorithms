(*Author: Liang Lin
Email: lianglin@outlook.com
Date: 2016-05-03*)

(*Test:
- use "mergeSort.sml";
- mergeSort (op <=) [2,1,3,5,6,4,9,7,8];*)

fun mergeSort (op <=) =
  let
    fun merge (xs, [])             = xs
        | merge ([], ys)           = ys
        | merge (x :: xs, y :: ys) =
          if x <= y then x :: merge (xs, y :: ys)
                   else y :: merge (x :: xs, ys)

    fun sort []    = []
        | sort [x] = [x]
        | sort xs  = let val m = length xs div 2 in
              merge (sort (List.take(xs, m)),
                     sort (List.drop(xs, m)))
            end
  in sort end
