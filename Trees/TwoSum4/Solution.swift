public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    let array = toArray(root)
    var begin = 0
    var end = array.count - 1
    var sum = 0
    while begin != end {
        sum = array[begin] + array[end]
        if sum == k {
            return true
        } else if sum > k {
            end -= 1
        } else {
            begin += 1
        }
    }
    return false
}

func toArray(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    inOrder(root, &result)
    return result
}

func inOrder(_ root: TreeNode?, _ arr: inout [Int]) {
    guard let node = root else { return }
    inOrder(node.left, &arr)
    arr.append(node.val)
    inOrder(node.right, &arr)
}
