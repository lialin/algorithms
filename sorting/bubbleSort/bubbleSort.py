#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Liang Lin
# Email: lianglin@outlook.com
# Date: 2016-03-27

# bubble sort has a "quadratic" worst-case running-time
# Θ(n^2)
def bubbleSort(A):
    n = len(A)
    for i in xrange(n-1):
        for j in xrange(n-1):
            if A[j] > A[j+1]:
                tmp    = A[j]
                A[j]   = A[j+1]
                A[j+1] = tmp
    print(A)

bubbleSort([2,1,3,6,9,5])
