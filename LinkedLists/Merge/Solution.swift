/*
 Merge Two Sorted Lists
    Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var first: ListNode? = l1
    var second: ListNode? = l2
    var head: ListNode?
    var tail: ListNode?
    
    while first != nil || second != nil {
        guard let f = first else {
            guard let s = second else { continue }
            appendNodeToList(&head, &tail, s)
            second = s.next
            continue
        }
        guard let s = second else {
            guard let f = first else { continue }
            appendNodeToList(&head, &tail, f)
            first = f.next
            continue
        }
        if f.val > s.val {
            appendNodeToList(&head, &tail, s)
            second = s.next
        } else {
            appendNodeToList(&head, &tail, f)
            first = f.next
        }
    }
    tail?.next = nil
    return head
}

func appendNodeToList(_ head: inout ListNode?, _ tail: inout ListNode?, _ node: ListNode) {
    if tail != nil {
        tail?.next = node
        tail = node
    } else {
        head = node
        tail = node
    }
}

