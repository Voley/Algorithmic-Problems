
/*
 String Compression: Implement a method to perform basic string compression using the counts of repeated characters.
 For example, the string aabcccccaaa would become a2b1c5a3.
 If the compressed string would not become smaller that the original string, your method should return the original string.
 You can assume the string has only uppercase and lowercase letters (a - z).
 */

func compress(_ str: String) -> String {
    
    var result = ""
    var counter = 0
    var lastCharacter = Character("0")
    
    for char in str {
        if lastCharacter != char {
            if counter > 0 {
                result.append(lastCharacter)
                result += "\(counter)"
            }
            lastCharacter = char
            counter = 1
        } else {
            counter += 1
        }
    }
    
    if counter > 0 {
        result.append(lastCharacter)
        result += "\(counter)"
    }
    
    if result.count > str.count {
        result = str
    }
    return result
}

print(compress("aaabbcccggggg"))
