/*
   Power Set
     Write a method to return all subsets of a set.
*/

func allSubsetsFrom(_ set:[Int]) -> [[Int]] {
    var result = Array<Array<Int>>()
    let total = 1 << set.count
    
    for i in 0..<total {
        result.append(subsetFrom(i, set))
    }
    return result
}

func subsetFrom(_ value: Int, _ set: [Int]) -> [Int] {
    var result = [Int]()
    var index = 0
    var offset = value
    while offset > 0 {
        if offset & 1 > 0 {
            result.append(set[index])
        }
        offset >>= 1
        index += 1
    }
    return result
}

print(allSubsetsFrom([1, 2, 3, 4]))
