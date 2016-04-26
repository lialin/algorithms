> module InsertionSort where

Author: Liang LIn
Email:
Date: 2016-04-26

> insert :: (Ord a) => [a] -> [a]
> insert [] = []
> insert [a] = [a]
> insert (x : y : ys)
>   | x <= y = x : y : ys
>   | otherwise = y : insert (x : ys)

> insertionSort :: (Ord a) => [a] -> [a]
> insertionSort [] = []
> insertionSort (x : xs) = insert (x : insertionSort xs)

Test:
Prelude> :load InsertionSort
*InsertionSort> insertionSort [3,2,15,1,4,7,9,6]
