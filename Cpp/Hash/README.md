# Hash Table vs. STL Map
Compare and contrast a has table and an STL map. How is hash table implemented? If the number of inputs is small, which data structure options can be used instead of a hash table?

# Solutions:

`map` is a binary search tree with keys. Its operations are `O(log n)`.  
  
`unordered_map` is a hash table and thus amortized `O(1)`  
`unordered_map` uses more memory.  

For smaller sets `map` is fine.
  
# C++
```
O(n)
```

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.