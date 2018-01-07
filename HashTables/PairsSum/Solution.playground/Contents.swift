struct Result {
    var a = 0
    var b = 0
}

func findPairs(_ from: [Int], _ toValue: Int) -> [Result] {
    var map = Dictionary<Int, Int>() // value, count
    for value in from {
        if let count = map[value] {
            map[value] = count + 1
        } else {
            map[value] = 1
        }
    }
    var result = [Result]()
    for value in from {
        if toValue - value == value && map[value] == 1 {
            continue
        }
        
        if let count = map[value] {
            if count == 0 {
                continue
            }
        }
        
        let target = toValue - value
        if let found = map[target] {
            if found > 0 {
                map[target] = found - 1
                result.append(Result(a: target, b: value))
            }
        }
    }
    return result
}

print(findPairs([1, 4, 3, 2, 5, 7], 5))
