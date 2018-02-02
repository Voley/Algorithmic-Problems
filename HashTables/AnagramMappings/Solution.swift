func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
    var mappings = Dictionary<Int, Int>()
    for i in 0..<B.count {
        mappings[B[i]] = i
    }
    var result = [Int]()
    for num in A {
        if let value = mappings[num] {
            result.append(value)
        }
    }
    return result
}
