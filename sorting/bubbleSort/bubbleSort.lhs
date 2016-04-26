> module BubbleSort where

Author: Liang Lin
Date: 2016-04-18

> bubble :: (Ord a) => [a] -> [a]
> bubble []  = []
> bubble [a] = [a]
> bubble (x : y : xs)
>   | x < y = x: bubble (y: xs)
>   | otherwise = y: bubble (x : xs)

> bubbleSort :: (Ord a) => [a] -> [a]
> bubbleSort []       = []
> bubbleSort (x : xs) = bubble(x : bubbleSort xs)

test
Prelude> :load BubbleSort
*BubbleSort> bubbleSort [6,2,3,8,9]
*BubbleSort> bubbleSort [10,6,2,3,8,9,1,7,101,20,90,86]
