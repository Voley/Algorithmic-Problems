func containsNumeralRepresentation(_ str: String, _ dict: Dictionary<String, [String]>) -> Array<String>?  {
    return dict[str]
}

func constructDictionary(_ dict: [String]) -> Dictionary<String, [String]> {
    let mapping: Dictionary<Character, Character> = ["a" : "2",
                                                     "b" : "2",
                                                     "c" : "2",
                                                     "d" : "3",
                                                     "e" : "3",
                                                     "f" : "3",
                                                     "g" : "4",
                                                     "h" : "4",
                                                     "i" : "4",
                                                     "j" : "5",
                                                     "k" : "5",
                                                     "l" : "5",
                                                     "m" : "6",
                                                     "n" : "6",
                                                     "o" : "6",
                                                     "p" : "7",
                                                     "q" : "7",
                                                     "r" : "7",
                                                     "s" : "7",
                                                     "t" : "8",
                                                     "u" : "8",
                                                     "v" : "8",
                                                     "w" : "9",
                                                     "x" : "9",
                                                     "y" : "9",
                                                     "z" : "9"]
    var result = Dictionary<String, [String]>()
    for word in dict {
        var tempString = ""
        for c in word {
            if let number = mapping[c] {
                tempString.append(number)
            }
        }
        if let array = result[tempString] {
            var tmp = array
            tmp.append(word)
            result[tempString] = tmp
        } else {
            result[tempString] = [word]
        }
    }
    return result
}

let dict = ["hello", "there", "yo", "xo"]
let adjusted = constructDictionary(dict)

print(containsNumeralRepresentation("96", adjusted)!)
