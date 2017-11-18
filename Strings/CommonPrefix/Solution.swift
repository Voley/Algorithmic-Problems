/*
 Write a function to find the longest common prefix string amongst an array of strings.
 */

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    if strs.count == 1 {
        return strs[0]
    }
    var prefix = strs[0]
    for str in strs {
        if !str.hasPrefix(prefix) {
            prefix = commonPrefix(prefix, str)
        }
    }
    return prefix
}

func commonPrefix(_ s1: String, _ s2: String) -> String {
    var counter = 0
    var result = ""
    for (c1, c2) in zip(s1, s2) {
        if c1 != c2 {
            break
        }
        counter += 1
        result.append(c1)
    }
    
    return result
}

let arr = ["John", "Joey", "Josephine"]
let common = longestCommonPrefix(arr)

print("Longest prefix of \(arr) is \(common)")
