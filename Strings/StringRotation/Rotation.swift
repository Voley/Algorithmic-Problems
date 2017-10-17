
/*
 String Rotation:
 Assume you have a method isSubstring which checks if one word is a substring of another.
 Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only
 one call to isSubstring(e.g. "waterbottle" is a rotation of "erbottlewat").
 */

import Foundation

func containsRotation(_ first: String, _ second: String) -> Bool {
    if first.count == second.count {
        return checkSubstring(second + second, first)
    }
    return false
}

// check if first string contains second inside it
func checkSubstring(_ first: String, _ second: String) -> Bool {
    return first.range(of: second) != nil
}

let contains = containsRotation("abc", "cab")

print("Is \"cab\" rotation of \"abc\"?", contains)

