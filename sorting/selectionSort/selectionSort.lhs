> module SelectionSort where

Author: Liang LIn
Email: lianglin@outlook.com
Date: 2016-04-26

Test:
Prelude> :load SelectionSort
*SelectionSort> selectionSort [2,3,1,4,5,9,8,7]

> selectionSort :: (Ord a) => [a] -> [a]
> selectionSort =
>   let
>     select [] = Nothing
>     select (x : xs) = Just (
>       case select xs of
>         Nothing -> (x, xs)
>         Just (m, ys) -> if x <= m then (x, xs)
>                                   else (m, x : ys))
>
>     sort xs =
>       case select xs of
>         Nothing -> []
>         Just (m, ys) -> m : sort ys
>   in sort
