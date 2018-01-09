
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var result: ListNode?
    var prev = head
    var next = head?.next
    
    while let p = prev {
        if p.val != val && result == nil {
            result = p
        }
        
        if let n = next {
            if n.val == val {
                prev?.next = n.next
                next = prev?.next
                continue
            }
        }
        prev = next
        next = next?.next
    }
    return result
}
