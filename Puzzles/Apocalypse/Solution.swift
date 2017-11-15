/*
 The Apocalypse
    In the new post-apocalyptic world, the world queen is desperately concerned about the birth rate. Therefore, she decrees that all families should ensure that they have one girl or else they face massive fines. If all families abide by this polcy - that is, they have continue to have children until they have one girl, at which point they immediately stop - what will the gender ratio of the new generation be? (Assume that the odds of someone having a boy or a girl on any given pregnancy is equal.) Solve this out logically and then write a computer simulation of it.
*/

import Foundation

func generateFamily() -> Array<Int> {
    var boys = 0
    var girls = 0
    
    var random = arc4random_uniform(2)
    
    while random == 1 && boys < 5 {
        random = arc4random_uniform(2)
        boys += 1
    }
    if boys < 6 {
        girls += 1
    }
    return [boys, girls]
}

func generateGeneration() {
    var boys = 0
    var girls = 0
    
    for _ in 0..<10000 {
        let res = generateFamily()
        boys += res[0]
        girls += res[1]
    }
    print("Boys: \(boys), Girls: \(girls)")
}

generateGeneration()
