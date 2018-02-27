class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        value = val
    }
    
    func printInOrder() {
        print(" \(value)")
        left?.printInOrder()
        right?.printInOrder()
    }
}

func serialize(_ node: TreeNode?, _ output: inout String) {
    if node == nil {
        output.append("n ")
    } else {
        output.append("\(node!.value) ")
        serialize(node?.left, &output)
        serialize(node?.right, &output)
    }
}

func deserialize(_ input: [String], _ index: Int, _ tempIndex: inout Int) -> TreeNode? {
    if index < input.count {
        if input[index] == "n" {
            tempIndex = index + 1
            return nil
        } else {
            if let value = Int(input[index]) {
                let root = TreeNode(value)
                root.left = deserialize(input, index + 1, &tempIndex)
                root.right = deserialize(input, tempIndex, &tempIndex)
                return root
            }
        }
    }
    return nil
}
