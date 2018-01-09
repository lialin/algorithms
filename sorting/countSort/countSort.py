def countSort(A, k):
  n = len(A)

  # create a 0-based list
  B = [0] * (k+1)

  # mark out the index in the list we created
  for i in xrange(n):
    B[A[i]] += 1
  
  # iterate through the list to find out the marked index
  incr = 0
  for i in xrange(k+1):
    for j in xrange(B[i]):
      A[incr] = i
      incr += 1
  return A

print(countSort([2,51,12,12,63,9,33,7,89, 10, 15], 90))
