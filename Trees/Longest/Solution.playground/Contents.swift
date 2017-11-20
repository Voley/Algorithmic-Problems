/*
  Longest Word in Dictionary
    Given a list of strings words representing an English Dictionary, find the longest word in words that can be built one character at a time by other words in words. If there is more than one possible answer, return the longest word with the smallest lexicographical order.
    If there is no answer, return the empty string.
*/

func longestWord(_ words: [String]) -> String {
    var trie = Trie()
    var index = 1
    for word in words {
        trie.insert(word, index)
        index += 1
    }
    trie.words = words
    return trie.dfs()
}

class Trie {
    var root: Node
    var words: Array<String> = []
    init() {
        root = Node("0")
    }
    
    func insert(_ word: String, _ index: Int) {
        var current = root
        for c in word {
            if current.children[c] == nil {
                current.children[c] = Node(c)
            }
            current = current.children[c]!
        }
        current.end = index
    }
    
    func dfs() -> String {
        var result = ""
        var stack = Stack<Node>()
        stack.push(root)
        while !stack.isEmpty() {
            guard let node = stack.pop() else { continue }
            if node.end > 0 || node == root {
                if node != root {
                    let word = words[node.end - 1]
                    if word.count > result.count ||
                        word.count == result.count && word < result {
                        result = word
                    }
                }
                for n in node.children.values {
                    stack.push(n)
                }
            }
        }
        return result
    }
    
    class Node: Comparable {
        var c: Character
        var children: Dictionary<Character, Node> = [:]
        var end: Int = 0
        init(_ character: Character) {
            c = character
        }
        static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.c < rhs.c
        }
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.c == rhs.c
        }
    }
}

class Stack<T: Comparable> {
    var last: Node?
    
    func push(_ item: T) {
        let node = Node(item)
        node.next = last
        last = node
    }
    
    func pop() -> T? {
        let temp = last
        last = last?.next
        return temp?.value
    }
    
    func isEmpty() -> Bool {
        return last == nil
    }
    
    class Node {
        var next: Node?
        var value: T?
        var min: Node?
        
        init(_ value: T) {
            self.value = value
        }
    }
}
