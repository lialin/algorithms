(*Author: Liang LIn
Email: lianglin@outlook.com
Date: 2016-04-26*)

(*Test:
use "selectionSort.sml";
selectionSort (op <=) [10,8,9,7,4,5,2,1,6];*)

fun selectionSort (op <=) =
  let
    fun select [] = NONE
      | select (x :: xs) = SOME (
          case select xs of
            NONE => (x, xs)
          | SOME (y, ys) => if x <= y then (x, xs)
                                      else (y, x :: ys)
        )
    fun sort xs =
      case select xs of
        NONE => []
        | SOME (y, ys) => y :: sort ys
    in sort end
