/*
 Hamming Distance
     The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
     Given two integers x and y, calculate the Hamming distance.
 */

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var temp = x ^ y
    var result = 0
    while temp > 0 {
        if temp & 1 > 0 {
            result += 1
        }
        temp >>= 1
    }
    return result
}

print("Hamming distance between 11 and 45 is \(hammingDistance(11, 45))")
