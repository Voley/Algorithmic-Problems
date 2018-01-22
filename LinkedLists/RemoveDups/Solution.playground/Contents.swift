public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head
    while current != nil {
        if current?.val == current?.next?.val {
            current?.next = current?.next?.next
        } else {
            current = current?.next
        }
    }
    return head
}

