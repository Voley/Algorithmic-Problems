func areSentencesSimilar(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
    if words1.count != words2.count {
        return false
    }
    let table = buildTable(pairs)
    for (w1, w2) in zip(words1, words2) {
        if let set = table[w1] {
            if !set.contains(w2) && (w1 != w2) {
                return false
            }
        } else {
            return false
        }
    }
    return true
}

func buildTable(_ pairs: [[String]]) -> Dictionary<String, Set<String>> {
    var result = Dictionary<String, Set<String>>()
    for array in pairs {
        result[array[0], default: Set<String>()].insert(array[1])
        result[array[1], default: Set<String>()].insert(array[0])
    }
    return result
}

print(areSentencesSimilar(["hello", "yo"], ["hi", "there"], [["hello", "hi"], ["yo", "there"]]))
