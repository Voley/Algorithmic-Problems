/*
 Flip Bit to Win
 You have an integer and you can flip exactly one bit from a 0 to a 1. Write code to find the length of the longest sequence of 1s you could create.
 EXAMPLE
 Input: `1775` (or: `11011101111`)
 Output: `8`
 */

func flipBit(_ value: Int) -> Int {
    
    if ~value == 0 {
        return value
    }
    
    var temp = value
    var currentLength = 0
    var previousLength = 0
    var maxLength = 1
    
    while temp != 0 {
        if (temp & 1) == 1 { //current bit is 1
            currentLength += 1
        } else if (temp & 1) == 0 { // current bit is 0
            previousLength = (temp & 2) == 0 ? 0 : currentLength
            currentLength = 0
        }
        maxLength = max(previousLength + currentLength + 1, maxLength)
        temp = temp >> 1
    }
    return maxLength
}

print(flipBit(254))
