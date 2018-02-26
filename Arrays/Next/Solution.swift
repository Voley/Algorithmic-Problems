func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
    var stack = [Int]()
    var dict = Dictionary<Int, Int>() // number, greater number
    var prev: Int?
    for i in nums {
        if let p = prev {
            if i > p {
                dict[p] = i
                while let popped = stack.popLast() {
                    if popped < i {
                        dict[popped] = i
                    } else {
                        stack.append(popped)
                        break
                    }
                }
            }
            stack.append(i)
            prev = i
        } else {
            prev = i
            stack.append(i)
        }
    }
    var result = [Int]()
    for i in findNums {
        if let target = dict[i] {
            result.append(target)
        } else {
            result.append(-1)
        }
    }
    return result
}
