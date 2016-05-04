#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Liang Lin
# Email: lianglin@outlook.com
# Date: 2016-05-03

# Θ(nlogn)
def mergeSort(A):
    result = []
    n = len(A)
    m = int(n/2)
    if n < 2:
        return A[:]
    i = 0
    j = 0
    X = mergeSort(A[:m])
    Y = mergeSort(A[m:])
    while i < len(X) and j < len(Y):
        if X[i] < Y[j]:
            result.append(X[i])
            i+=1
        else:
            result.append(Y[j])
            j+=1
    result += X[i:]
    result += Y[j:]
    return result

print(mergeSort([5,8,7,6,4,3,9,1,2]))
