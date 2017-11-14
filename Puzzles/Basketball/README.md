# Basketball
You have a basketball hoop and someone says that you can play one of two games.  
Game 1: You get one shot to make the hoop.
Game 2: You get three shots and you have to make two of three shots.  
If p is the probability of making a particular shot, for which values of p should you pick one game or the other?


# Solutions:

Chances to win first game: `p`   
Chances to win second game:   
`p * p * p` - making all 3 shots   
`p * p * (1 - p)` - making 2 of the shots   
`p * p * (1 - p)` - making 2 of the shots in other variation   
`p * p * (1 - p)` - making 2 of the shots in other variation    
Total chance to win second game: `3p^2 - 2p^3`  
If `p == 0, 0.5 or 1` it doesn't matter which game to play  
if `0 < p < 0.5`, we should play game 1  
if `0.5 < p < 1`, we should play game 2  

# Swift

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.