/*
 The Egg Drop Problem
 There is a building of 100 floors. If an egg drops from the Nth floor or above, it will break. If it's dropped from any floor below, it will not break. You're given two eggs. Find N, while minimizing the number of drops for the worst case.
 */

func eggDrop(_ eggs: Int, _ floors: Int) -> Int {
    if floors == 0 || floors == 1 {
        return floors
    }
    
    if eggs == 1 {
        return floors
    }
    
    var min = Int.max
    var x = 1
    var res = 0
    
    while true {
        if x > floors {
            break
        }
        res = max(eggDrop(eggs - 1, x - 1), eggDrop(eggs, floors - x))
        
        if res < min {
            min = res
        }
        x += 1
    }
    return min + 1
}

print(eggDrop(2, 15))
