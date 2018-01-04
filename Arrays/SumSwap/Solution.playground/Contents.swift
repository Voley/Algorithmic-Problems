func sumSwap(_ first: [Int], _ second: [Int]) -> [Int] {
    let target = calculateTarget(first, second)
    if target == 0 {
        return [0]
    }
    var result = [Int]()

    var set = Set<Int>()
    for value in second {
        set.insert(value)
    }
    
    for value in first {
        let two = value - target
        if set.contains(two) {
            return [value, two]
        }
    }
    return [0]
}

func calculateTarget(_ first: [Int], _ second: [Int]) -> Int {
    let sumA = first.reduce(0, +)
    let sumB = second.reduce(0, +)
    
    if (sumA - sumB) % 2 != 0 {
        return 0
    }
    return (sumA - sumB) / 2
}

let f = [1, 2, 3, 4, 5, 6, 9]
let s = [1, 2, 3, 4, 5, 10, 7]

let result = sumSwap(f, s)
