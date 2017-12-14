# Virtual Base Class
Why does a destructor in base class need to be declared virtual?

# Solutions:
  
If it is not virtual, we might leak memory if we init object as parent class and then release it.

# C++
```
O(1)
```

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.