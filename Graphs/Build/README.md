# Build Order
You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependant on the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.
### EXAMPLE
`projects: a, b, c, d, e, f`
`dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)`
`Output: f, e, a, b, d, c`  


# Solutions:

# Swift
```
O(n)
```

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.
