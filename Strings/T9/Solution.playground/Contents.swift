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

class TrieNode {
    var letter: Character?
    var terminates = false
    var children: Dictionary<Character, TrieNode>
    init (_ letter: Character) {
        self.letter = letter
        children = [:]
    }
    func add(_ word: String) {
        if word.count == 0 {
            return
        }
        let finished = word.count == 1
        
        let c = word[word.startIndex]
        if let child = children[c] {
            child.add(String(word.suffix(word.count - 1)))
            child.terminates = finished
        } else {
            let child = TrieNode(c)
            child.terminates = finished
            children[c] = child
            child.add(String(word.suffix(word.count - 1)))
        }
    }
    
    func contains(_ word: String) -> Bool {
        var currentChild: TrieNode? = self
        for (index, c) in word.enumerated() {
            if let child = currentChild?.children[c] {
                currentChild = child
                if index == word.count - 1 && child.terminates {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
}

let node = TrieNode("0")
let dict = ["hello", "there", "yo", "xo"]
let adjusted = constructDictionary(dict)

print(containsNumeralRepresentation("96", adjusted)!)
