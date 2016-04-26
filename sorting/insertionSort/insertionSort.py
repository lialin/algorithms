#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Liang LIn
# Email:
# Date: 2016-04-26

# Θ(n^2)
def insertionSort(A):
    n = len(A)
    for i in range(n-2, -1, -1):
        key = A[i]
        j = i + 1
        while (j < n and key > A[j]):
            A[j-1] = A[j]
            j+=1
        A[j-1] = key
    print(A)

insertionSort([7,2,9,4,5,10,25,12])
