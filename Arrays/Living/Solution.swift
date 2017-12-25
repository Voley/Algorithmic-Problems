/*
    Living People
      Given a list of people with their birth and death years, implement a method to compute the years with the most number of people alive. You may assume that all people were born between 1900 and 2000(inclusive). If a person was alive during any portion of that year, they should be included in that year's count. For example, Person (birth = 1908, death = 1909) is included in the counts for both 1908 and 1909.
 */

class Person {
    var birthYear: Int
    var deathYear: Int
    
    init(_ birth: Int, death: Int) {
        birthYear = birth
        deathYear = death
    }
}

func maxAliveYear(_ people: [Person], _ minimum: Int, _ maximum: Int) -> Int {
    let deltas = getPopulationDeltas(people, minimum, maximum)
    let maxAliveYear = getMaxAliveYear(deltas)
    return maxAliveYear + minimum
}

func getPopulationDeltas(_ people: [Person], _ minimum: Int, _ maximum: Int) -> [Int] {
    var delta = Array<Int>(repeatElement(0, count: maximum - minimum + 2))
    for person in people {
        let b = person.birthYear - minimum;
        delta[b] += 1
        let d = person.deathYear - minimum;
        delta[d + 1] -= 1
    }
    return delta
}

func getMaxAliveYear(_ deltas: [Int]) -> Int {
    var maxAliveYear = 0
    var maxAlive = 0
    var currentlyAlive = 0
    
    for i in 0..<deltas.count {
        currentlyAlive += deltas[i]
        if currentlyAlive > maxAlive {
            maxAliveYear = i;
            maxAlive = currentlyAlive
        }
    }
    return maxAliveYear
}

let p1 = Person(1900, death: 1950)
let p2 = Person(1925, death: 1975)
let p3 = Person(1925, death: 1980)
let p4 = Person(1951, death: 1999)

print(maxAliveYear([p1, p2, p3, p4], 0, 2000))

