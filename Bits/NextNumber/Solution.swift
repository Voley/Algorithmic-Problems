/*
 Next Number
 Given a positive integer, print the next smallest and the next largest number that have the same number of 1 bits in their binary representation.
 */

func prevNumber(_ value: Int) -> Int {
    var temp = value
    var n = value
    var c0 = 0
    var c1 = 0
    while temp & 1 == 1 {
        c1 += 1
        temp >>= 1
    }
    
    if temp == 0 {
        return -1
    }
    
    while ((temp & 1) == 0) && (temp != 0) {
        c0 += 1
        temp >>= 1
    }
    
    let p = c0 + c1 // position of rightmost non-trailing one
    n &= ((~0) << (p + 1)); // clears from bit p onwards
    let mask = (1 << (c1 + 1)) - 1 // sequence of c1 + 1 ones
    n |= mask << (c0 - 1)
    
    return n
}

func nextNumber(_ value: Int) -> Int {
    
    var n = value
    var c = value
    var c0 = 0
    var c1 = 0
    while (((c & 1) == 0) && (c != 0)) {
        c0 += 1
        c >>= 1
    }
    
    while ((c & 1) == 1) {
        c1 += 1
        c >>= 1
    }
    
    if c0 + c1 == 31 || c0 + c1 == 0 {
        return -1
    }
    
    let p = c0 + c1 // rightmost non trailing zero
    n |= (1 << p) // flip rightmost non trailing zero
    n &= ~((1 << p) - 1) // clear all bits to the right of p
    n |= (1 << (c1 - 1)) - 1 // insert c1 - 1 ones on the right
    return n
}

let number = 100
let a = nextNumber(number)
let b = prevNumber(number)

print(a, b)
