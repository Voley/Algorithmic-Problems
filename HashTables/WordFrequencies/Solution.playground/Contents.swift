/*
  Word Frequencies
    Design a method to find the frequency of occurrences of any given word in a book. What if we were running this algorithm multiple times?
 */

import Foundation

func buildFrequencies(_ book: String) -> Dictionary<String, Int> {
    var result = Dictionary<String, Int>()
    book.enumerateSubstrings(in: book.startIndex..<book.endIndex, options: .byWords) { (word, _, _, _) in
        if let w = word?.lowercased() {
            if let num = result[w] {
                result[w] = num + 1
            } else {
                result[w] = 1
            }
        }
    }
    return result
}

func frequencyOfWord(_ word: String, _ hashTable: Dictionary<String, Int>) -> Int {
    if let number = hashTable[word.lowercased()] {
        return number
    }
    return 0
}

let book = """
Our little party of travelers awakened the next morning refreshed and full of hope, and Dorothy breakfasted like a princess off peaches and plums from the trees beside the river. Behind them was the dark forest they had passed safely through, although they had suffered many discouragements; but before them was a lovely, sunny country that seemed to beckon them on to the Emerald City.
To be sure, the broad river now cut them off from this beautiful land. But the raft was nearly done, and after the Tin Woodman had cut a few more logs and fastened them together with wooden pins, they were ready to start. Dorothy sat down in the middle of the raft and held Toto in her arms. When the Cowardly Lion stepped upon the raft it tipped badly, for he was big and heavy; but the Scarecrow and the Tin Woodman stood upon the other end to steady it, and they had long poles in their hands to push the raft through the water.
They got along quite well at first, but when they reached the middle of the river the swift current swept the raft downstream, farther and farther away from the road of yellow brick. And the water grew so deep that the long poles would not touch the bottom.
"""

let map = buildFrequencies(book)
print(frequencyOfWord("they", map))
