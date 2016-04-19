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
