
/*
 One Away: There are three types of edits that can be performed on strings:
 insert a character, remove a character, or replace a character.
 Given two strings, write a function to check if they are one edit(or zero edits) away.
 */

func editingDistanceWithinOne(_ first: String, _ second: String) -> Bool {
    
    if abs(first.count - second.count) > 1 {
        return false
    }
    
    if first.count == second.count {
        return isOneEditAway(first, second)
    } else if first.count + 1 == second.count {
        return isOneInsertAway(first, second)
    } else if first.count == second.count + 1 {
        return isOneInsertAway(second, first)
    }
    
    return false
}

private func isOneEditAway(_ first: String, _ second: String) -> Bool {
    
    var foundEdit = false
    
    let chars1 = first.characters
    let chars2 = second.characters
    
    var index = 0
    
    while index < chars1.count && index < chars2.count {
        let index1 = chars1.index(chars1.startIndex, offsetBy: index)
        let index2 = chars2.index(chars2.startIndex, offsetBy: index)
        
        if chars1[index1] == chars2[index2] {
            index += 1
        } else {
            if !foundEdit {
                foundEdit = true
            } else {
                return false
            }
            index += 1
        }
    }
    return true
}

private func isOneInsertAway(_ first: String, _ second: String) -> Bool {
    
    let chars1 = first.characters
    let chars2 = second.characters
    
    var indexFirst = 0
    var indexSecond = 0
    
    var foundCharacter = false
    
    while indexSecond < chars2.count && indexFirst < chars1.count {
        
        let index1 = chars1.index(chars1.startIndex, offsetBy: indexFirst)
        let index2 = chars2.index(chars2.startIndex, offsetBy: indexSecond)
        
        if chars1[index1] == chars2[index2] {
            indexFirst += 1
            indexSecond += 1
        } else {
            if !foundCharacter {
                foundCharacter = true
                indexSecond += 1
            } else {
                return false
            }
        }
    }
    return true
}

private func checkStrings(_ first: String, _ second: String) {
    print("Is " + "\"\(first)\"", "one distance away from", "\"\(second)\"?")
    print(editingDistanceWithinOne(first, second))
}

checkStrings("abc", "abd")
checkStrings("ab", "abc")
checkStrings("ab", "abcd")
checkStrings("ac", "a")
checkStrings("abz", "abc")
checkStrings("Himalayas", "Himaleyas")
checkStrings("Himalayas", "Himaeyas")

