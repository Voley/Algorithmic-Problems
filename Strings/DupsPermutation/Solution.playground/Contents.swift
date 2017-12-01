/*
  Permutations with Duplicates
    Write a method to compute all permutations of a string.
*/

import Foundation

func permute(_ str: String) -> [String] {
    var buf = Array(str)
    var result = Set<String>()
    permuteHelper(buf.count, &buf, &result)
    return Array(result)
}

func permuteHelper(_ n: Int, _ buffer: inout Array<Character>, _ result: inout Set<String>) {
    if n == 1 {
        let str = String(buffer)
        result.insert(str)
        return
    }

    for i in 0..<(n - 1) {
        permuteHelper(n - 1, &buffer, &result)
        buffer.swapAt(n - 1, (n % 2) == 1 ? 0 : i)
    }
    permuteHelper(n - 1, &buffer, &result)
}

print(permute("aabaa"))
