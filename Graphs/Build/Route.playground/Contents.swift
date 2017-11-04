/*
 Build Order
     You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependant on the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.
 EXAMPLE
 `projects: a, b, c, d, e, f`
 `dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)`
 `Output: f, e, a, b, d, c`
*/

class Graph<T: Hashable & Comparable> {
    var nodes: Array<GraphNode<T>>
    init() {
        nodes = []
    }
    func addEdgeBetween(_ first: GraphNode<T>, _ second: GraphNode<T>) {
        first.links.append(second)
    }
    func addNode(_ node: GraphNode<T>) {
        nodes.append(node)
    }
    
    func buildOrder() -> Array<T> {
        var stack = Stack<T>()
        var visited = Set<T>()
        
        for node in nodes {
            if !visited.contains(node.value) {
                node.innerBuildOrder(&visited, &stack)
            }
        }
        
        var result = Array<T>()
        while let s = stack.pop() {
            result.append(s)
        }
        return result
    }
    
    class GraphNode<T: Hashable & Comparable> {
        var value: T
        var links: Array<GraphNode>
        init (_ value: T) {
            self.value = value
            links = []
        }

        func innerBuildOrder(_ visited: inout Set<T>, _ stack: inout Stack<T>) {
            visited.insert(value)
            for n in links {
                if !visited.contains(n.value) {
                    n.innerBuildOrder(&visited, &stack)
                }
            }
            stack.push(value)
        }
    }
}


class Stack<T: Hashable & Comparable> {
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
    
    func peek() -> T? {
        let temp = last
        return temp?.value
    }
    
    func printStack() {
        var node = last
        print("Stack: ")
        var result = ""
        while node != nil {
            if let v = node?.value {
                result.append("\(v) ")
            }
            node = node?.next
        }
        print(result)
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

var g = Graph<String>()
var a = Graph<String>.GraphNode<String>("a")
var b = Graph<String>.GraphNode<String>("b")
var c = Graph<String>.GraphNode<String>("c")
var d = Graph<String>.GraphNode<String>("d")
var e = Graph<String>.GraphNode<String>("e")
var f = Graph<String>.GraphNode<String>("f")

g.addNode(a)
g.addNode(b)
g.addNode(c)
g.addNode(d)
g.addNode(e)
g.addNode(f)

g.addEdgeBetween(a, d)
g.addEdgeBetween(f, b)
g.addEdgeBetween(b, d)
g.addEdgeBetween(f, a)
g.addEdgeBetween(d, c)

print(g.buildOrder())


