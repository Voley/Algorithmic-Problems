/*
 Route Between Nodes:
 Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

 */

class GraphNode {
    var children: Array<GraphNode> = []
    var isVisited = false
    
    func bfs(_ target: GraphNode) -> Bool {
        let q = Queue<GraphNode>()
        q.enqueue(self)
        while let n = q.dequeue() {
            if n === target {
                return true
            }
            n.isVisited = true
            for child in n.children {
                if !child.isVisited {
                    q.enqueue(child)
                }
            }
        }
       return false
    }
}

// supplementary classes

class Node<T> {
    var next: Node?
    var prev: Node?
    var value: T
    init(_ item: T) {
        value = item
    }
}

class Queue<T> {
    private var first: Node<T>?
    private var last: Node<T>?
    
    func enqueue(_ item: T) {
        let wrap = Node(item)
        if first == nil {
            first = wrap
            last = wrap
        } else {
            last?.prev = wrap
            wrap.next = last
            last = wrap
        }
    }
    
    func dequeue() -> T? {
        if let f = first {
            let temp = f.prev
            temp?.next = nil
            first = temp
            return f.value
        }
        return nil
    }
    
    func peek() -> T? {
        return first?.value
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
}

let n1 = GraphNode()
let n2 = GraphNode()
let n3 = GraphNode()
let n4 = GraphNode()
let n5 = GraphNode()

n1.children = [n2, n3]
n3.children = [n4]

n1.bfs(n5)


