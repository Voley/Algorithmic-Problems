func add(_ a: Int, _ b: Int) -> Int {
    var tempA = a
    var tempB = b
    while tempB != 0 {
        let sum = tempA ^ tempB
        let carry = (tempA & tempB) << 1
        tempA = sum
        tempB = carry
    }
    return tempA
}

print(add(3, 21))
