/*
    Longest Substring Without Repeating Characters
         Given a string, find the length of the longest substring without repeating characters.
         Examples:
         Given "abcabcbb", the answer is "abc", which the length is 3.
         Given "bbbbb", the answer is "b", with the length of 1.
         Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    var array = Array(s)
    
    var dict = Dictionary<Character, Int>()
    var foundMax = 0
    var j: Int = 0
    for i in 0..<array.count {
        if let value = dict[array[i]] {
            j = max(j, value + 1)
        }
        dict[array[i]] = i
        foundMax = max(foundMax, i - j + 1)
    }
    return foundMax
}

let str = "hellothere"
print("Length of unique string in \(str) is : \(lengthOfLongestSubstring(str))")


