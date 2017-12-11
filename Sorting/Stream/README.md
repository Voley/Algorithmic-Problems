# Rank From Stream
Imagine you are reading in a stream of integers. Periodically, you wish to be able to look up the rank of a number x (the number of values less than or equal to x). Implement the data structures and algorithms to support these operations. That is, implement the method track (int x), which is called when each number is generated, and the method getRankOfNumber(int x), which returns the number of values less than or equal to x (not including x itself).  

EXAMPLE
```
Stream(in order of appearance): 5, 1, 4, 4, 5, 9, 7, 13, 3
getRankOfNumber(1) = 0
getRankOfNumber(3) = 1
getRankOfNumber(4) = 3
```
# Solutions:

# Swift
```
O(log n)
```
# C++
```
O(log n)
```

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.
