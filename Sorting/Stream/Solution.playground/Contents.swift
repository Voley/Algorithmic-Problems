/*
 Rank From Stream
    Imagine you are reading in a stream of integers. Periodically, you wish to be able to look up the rank of a number x (the number of values less than or equal to x). Implement the data structures and algorithms to support these operations. That is, implement the method track (int x), which is called when each number is generated, and the method getRankOfNumber(int x), which returns the number of values less than or equal to x (not including x itself).
 */

class Node {
    var left: Node?
    var right: Node?
    var data: Int
    
    var leftSize = 0
    var rightSize = 0
    
    init(_ value: Int) {
        data = value
    }
    
    func insert(_ number: Int) {
        if number <= data {
            if left == nil {
                left = Node(number)
            } else {
                left?.insert(number)
            }
            leftSize += 1
        } else {
            if right == nil {
                right = Node(number)
            } else {
                right?.insert(number)
            }
        }
    }
    
    func getRank(_ value: Int) -> Int {
        if (value == data) {
            return leftSize
        } else if value < data {
            if left == nil {
                return -1
            } else {
                return left!.getRank(value)
            }
        } else {
            let rightRank = right == nil ? -1 : right!.getRank(value)
            if rightRank == -1 {
                return -1
            } else {
                return leftSize + 1 + rightRank
            }
        }
    }
}

func track(_ number: Int, _ root: inout Node?) {
    if root == nil {
        root = Node(number)
    } else {
        root?.insert(number)
    }
}

func getRankOfNumber(_ number: Int) -> Int {
    if let r = root {
        return r.getRank(number)
    }
    return -1
}

var root: Node?

let arr = [5, 1, 4, 4, 5, 9, 7, 13, 3]

for i in arr {
    track(i, &root)
}

print(getRankOfNumber(1))
print(getRankOfNumber(3))
print(getRankOfNumber(4))
