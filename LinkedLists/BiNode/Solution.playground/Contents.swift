class BiNode {
    var node1: BiNode?
    var node2: BiNode?
    var value: Int
    init(_ v: Int) {
        value = v
    }
}

func convertToCircular(_ root: BiNode?) -> BiNode? {
    if root == nil {
        return nil
    }
    
    let part1 = convertToCircular(root?.node1)
    let part3 = convertToCircular(root?.node2)
    
    if part1 == nil && part3 == nil {
        root?.node1 = root
        root?.node2 = root
        return root
    }
    
    let tail3 = part3 == nil ? nil : part3?.node1
    
    // join left to root
    if part1 == nil {
        concat(part3?.node1, root)
    } else {
        concat(part1?.node1, root)
    }
    
    // join right to root
    
    if part3 == nil {
        concat(root, part1)
    } else {
        concat(root, part3)
    }
    
    // join right to left
    
    if part1 != nil && part3 != nil {
        concat(tail3, part1)
    }
    
    return part1 == nil ? root : part1
}

func concat(_ x: BiNode?, _ y: BiNode?) {
    x?.node2 = y
    y?.node1 = x
}

func convert(_ root: BiNode?) -> BiNode? {
    let head = convertToCircular(root)
    head?.node1?.node2 = nil
    head?.node1 = nil
    return head
}
