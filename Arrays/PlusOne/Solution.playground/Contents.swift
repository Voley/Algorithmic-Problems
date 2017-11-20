/*
   Plus One
     Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
     You may assume the integer do not contain any leading zero, except the number 0 itself.
     The digits are stored such that the most significant digit is at the head of the list.
*/
func plusOne(_ digits: [Int]) -> [Int] {
    var temp = digits
    var shouldCarry = true
    for i in stride(from: temp.count - 1 , to: -1, by: -1) {
        if !shouldCarry {
            return temp
        }
        temp[i] += 1
        if temp[i] >= 10 {
            temp[i] %= 10
            shouldCarry = true
        } else {
            shouldCarry = false
        }
    }
    if shouldCarry {
        temp.insert(1, at:0)
    }
    return temp
}

print(plusOne([9, 9, 9]))
