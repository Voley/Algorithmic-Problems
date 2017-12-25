/*
 Diving Board
 You are building a diving board by placing a bunch of planks of wood end-to-end. There are two types of planks, one of length shorter and one of length longer. You must use exactly K planks of wood. Write a method to generate all possible lengths for the diving board.
 */

func allLengths(_ total: Int, _ shorter: Int, _ longer: Int) -> Set<Int> {
    var set = Set<Int>()
    for i in 0...total {
        let longerCount = total - i
        let shorterCount = i
        set.insert(longer * longerCount + shorter * shorterCount)
    }
    return set
}

print(allLengths(3, 2, 3))
