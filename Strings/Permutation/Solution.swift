/*
 Permutations without Duplicates
    Write a method to compute all permutations of a string of unique characters.
 */

import Foundation

func permute(_ str: String) -> [String] {
    var buf = Array(str)
    var result = Array<String>()
    permuteHelper(buf.count, &buf, &result)
    return result
}

func permuteHelper(_ n: Int, _ buffer: inout Array<Character>, _ result: inout Array<String>) {
    if n == 1 {
        let str = String(buffer)
        result.append(str)
        return
    }
    
    for i in 0..<(n - 1) {
        permuteHelper(n - 1, &buffer, &result)
        buffer.swapAt(n - 1, (n % 2) == 1 ? 0 : i)
    }
    permuteHelper(n - 1, &buffer, &result)
}

print(permute("abc"))

