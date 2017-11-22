/*
   Valid Palindrome
     Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
*/

import Foundation

func isPalindrome(_ s: String) -> Bool {
    let set = CharacterSet.alphanumerics.inverted
    let after = s.lowercased().components(separatedBy: set).joined()
    let arr = Array(after)
    var first = 0
    var last = arr.count - 1
    
    while first < last {
        if arr[first] != arr[last] {
            return false
        }
        first += 1
        last -= 1
    }
    return true
}

isPalindrome("hello")
isPalindrome("pazap")
isPalindrome("aba")
