> module MergeSort where
> import qualified Data.List as List

Author: Liang Lin
Email: lianglin@outlook.com
Date: 2016-05-03

Test:
Prelude> :load MergeSort
*MergeSort> mergeSort [2,1,3,6,7,4,5,10,9,8]

> mergeSort :: (Ord a) => [a] -> [a]
> mergeSort =
>   let
>     sort []  = []
>     sort [x] = [x]
>     sort xs  = merge (sort (List.take m xs),
>                       sort (List.drop m xs))
>                where m = length xs `div` 2
>
>     merge (xs, []) = xs
>     merge ([], ys) = ys
>     merge (x:xs, y:ys)
>       | x <= y    = x : merge (xs, y:ys)
>       | otherwise = y : merge (x:xs, ys)
>   in sort
