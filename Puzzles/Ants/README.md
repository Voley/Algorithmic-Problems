# Ants on a Triangle
There are three ants on different vertices of a triangle. What is probability of collision (between any two or all of them) if they start walking on the sides of the triangle? Assume that each ant randomly picks a direction, with either direction being equally likely to be chosen, and that they walk at the same speed.
Similarly, find the possibility of collision with n ants on an n-vertex polygon.

# Solutions:
Ants don't meet if they go clockwise or counterclockwise. All other ways they meet. Formula for that:  
`P(clockwise) = 0.5^3`  
`P(counter clockwise) = 0.5^3`  
`P(collision) = 1 - 0.5^3 - 0.5^3`  
General case formula: `P = 1 - 0.5^n-1`  

# Swift

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.