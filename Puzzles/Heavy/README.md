# The Heavy Pill
You have 20 bottles of pills. 19 bottles have 1.0 gram pills, but one has pills of weight 1.1 grams. Given a scale that provides an exact measurement, how would you find the heavy bottle? You can only use the scale once.

# Solutions:

Take an increasing number of pills from each bottle, e.g. 1, 2, 3... 20.
This sum will be `(20 * (20 + 1)) / 2` + some extra from heavier pills
Index of a bottle with heavier pills is:  
`(totalSum - sum) / 0.1`

# Swift

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.
