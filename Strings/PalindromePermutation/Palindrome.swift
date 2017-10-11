
/*
 Palindrome Permutation:
 Given a string, write a function to check if it is a permutation of a palindrome.
 A palindrome is a word or phrase that is the same forwards and backwards.
 A permutation is a rearrangement of letters.
 The palindrome does not need to be limited to just dictionary words.
 */

extension String {
    func isPalindrome() -> Bool {
        var dict = Dictionary<Character, Int>()
        for char in self {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        let odd = count % 2 != 0
        var oddFound = false
        
        for (_, value) in dict {
            if value % 2 != 0 {
                if odd {
                    if !oddFound {
                        oddFound = true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return true
    }
}

print("Is \"\" a palindrome? ", "".isPalindrome())
print("Is \" \" a palindrome? ", " ".isPalindrome())
print("Is \"  \" a palindrome? ", "  ".isPalindrome())
print("Is \"ahahk\" a palindrome? ", "ahahk".isPalindrome())
print("Is \"aaccgg\" a palindrome? ", "aaccgg".isPalindrome())
print("Is \"abc\" a palindrome? ", "abc".isPalindrome())
