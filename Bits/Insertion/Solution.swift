/*
 Insertion
 You are given two 32-bit numbers, N and M, and two bit positions, i and j. Write a method to insert M into N such that M starts at bit `j` and ends at bit `i`. You can assume that the bits j through i have enough space to fit all of M. That is, if M = 10011, you can assume that there are at least 5 bits between j and i. You would not, for example, have j = 3 and i = 2, because M could not fully fit between bit 3 and bit 2.
 EXAMPLE
 Input:     N = 10000000000, M = 10011, i = 2, j = 6
 Output:    N = 10001001100
 */

func updateBits(_ target: Int, _ value: Int, _ start: Int, _ end: Int) -> Int {
    // create a mask to clear bits i to j
    let allOnes: Int = ~0
    
    let left: Int = allOnes << (end + 1)
    let right: Int = ((1 << start) - 1)
    
    let mask: Int = left | right
    
    // clear bits end through start then put value in there
    let nCleared: Int = target & mask
    let mShifted: Int = value << start
    
    return nCleared | mShifted
}

func printInBinary(_ value: Int) {
    print(String(value, radix: 2))
}

let value = 1024
let insert = 5

print("Attempting to insert: ");
printInBinary(insert)
print("Into: ")
printInBinary(value)
print("At position 2, 5")

let result = updateBits(value, insert, 2, 5)

print("Result: ")
printInBinary(result)
