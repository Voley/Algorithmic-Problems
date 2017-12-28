
struct Result {
    var hits = 0
    var pseudoHits = 0
}

func mastermind(_ query: String , _ solution: String) -> Result {
    var hits = 0
    var pseudoHits = 0
    var dict = Dictionary<Character, Int>()
    
    for (number, ch) in solution.enumerated() {
        dict[ch] = number
    }
    
    var found = Set<Character>()
    
    for (number, ch) in query.enumerated() {
        if dict[ch] == number {
            hits += 1
            found.insert(ch)
        }
    }
    
    for ch in query {
        if !found.contains(ch) && solution.contains(ch) {
            pseudoHits += 1
            found.insert(ch)
        }
    }
    
    return Result(hits: hits, pseudoHits: pseudoHits)
}

print(mastermind("GGRR", "RGBY"))

