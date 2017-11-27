/*
 String Compression
     Given an array of characters, compress it in-place.
     The length after compression must always be smaller than or equal to the original array.
     Every element of the array should be a character (not int) of length 1.
     After you are done modifying the input array in-place, return the new length of the array.
 */

func compress(_ chars: inout [Character]) -> Int {
    
    var left = 0
    var right = 0
    var write = 0
    
    for i in 0...chars.count {
        if i == chars.count {
            let sum = right - left
            writeLetter(chars[left], sum, &write, &chars)
        } else {
            if chars[left] != chars[right] {
                let sum = right - left
                writeLetter(chars[left], sum, &write, &chars)
                left = right
            }
        }
        right += 1
    }
    return write
}

func writeLetter(_ c: Character, _ sum: Int, _ index: inout Int, _ arr: inout [Character]) {
    arr[index] = c
    index += 1
    if sum > 9 {
        arr[index] = [Character](String(sum / 10))[0]
        arr[index + 1] = [Character](String(sum % 10))[0]
        index += 2
    } else if sum > 1 {
        arr[index] = [Character](String(sum))[0]
        index += 1
    }
}

