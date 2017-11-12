/*
 Conversion
 Write a function to determine the number of bits you would need to flip to convert integer A to integer B
 EXAMPLE
 `Input: 29 (or: 11101), 15 (or: 01111)`
 `Output: 2`
 */

func bitSwapsRequired(_ first: Int, _ second: Int) -> Int {
    var counter = 0
    var temp = first ^ second
    while temp != 0 {
        counter += 1
        temp = temp & (temp - 1)
    }
    return counter
}

print("Swaps required between 10 and 256: \(bitSwapsRequired(10, 256))")
