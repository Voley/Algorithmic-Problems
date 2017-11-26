/*
  File System
    Explain the data structures and algorithms that you would use to design an in-memory file system. Illustrate with an example in code where possible.
 */

class FileSystem {
    var root = Folder("Root", 0)
    
    func availableSpace() -> Int {
        // find out how much space is left in memory
        return 0
    }
    func canAllocateSpace(_ amount: Int) -> Bool {
        return true
    }
    
    func totalSize() ->Int {
        return root.size()
    }
}

class Node: SizeReporting {
    var parent: Node?
    var name: String
    var dateCreated: Int
    var dateAccessed: Int
    
    init(_ name: String, _ createdDate: Int) {
        self.name = name
        dateCreated = createdDate
        dateAccessed = createdDate
    }
    
    func size() -> Int {
        return 0
    }
}

class File: Node  {
    var data = Array<UInt64>()
    
    override func size() -> Int {
        return data.count * 8
    }
}

class Folder: Node {
    var children = Array<Node>()
    
    override func size() -> Int {
        var total = 0
        for ch in children {
            total += ch.size()
        }
        return total
    }
    
    func createFile(_ name: String, _ data: [UInt64]) {
        let node = File(name, 100)
        node.data = data
        children.append(node)
    }
    
    func delete(_ node: Node) {}
    
}

protocol SizeReporting {
    func size() -> Int
}
