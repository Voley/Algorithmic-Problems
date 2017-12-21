/*
    Word Pattern
       Given a pattern and a string str, find if str follows the same pattern.
       Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
*/

import Foundation

func wordPattern(_ pattern: String, _ str: String) -> Bool {
    let words = str.components(separatedBy: " ")
    
    if words.count != pattern.count {
        return false
    }
    
    var mapping = Dictionary<Character, String>()
    var backwardsMapping = Dictionary<String, Character>()
    for (ch, word) in zip(pattern, words) {
        if mapping[ch] == nil && backwardsMapping[word] == nil {
            mapping[ch] = word
            backwardsMapping[word] = ch
        } else {
            if mapping[ch] != word {
                return false
            }
        }
    }
    return true
}
