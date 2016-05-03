#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Liang LIn
# Email: lianglin@outlook.com
# Date: 2016-04-26

# Θ(n^2)
def selectionSort(A):
    n = len(A)
    for i in xrange(n):
        min = i
        for j in xrange(i+1, n):
            if A[min] > A[j]:
                min = j
        temp = A[i]
        A[i] = A[min]
        A[min] = temp
    print(A)

selectionSort([2,3,1,6,9,7,8,5,4,10])
