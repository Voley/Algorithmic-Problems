/*
 Merge k Sorted Lists
    Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var allLists = lists
    
    var head: ListNode?
    var tail: ListNode?
    var index = minimumNodeIndex(allLists)
    while index != -1 {
        if let least = allLists[index] {
            if let next = least.next {
                allLists[index] = next
            } else {
                allLists.remove(at: index)
            }
            least.next = nil
            if tail != nil {
                tail?.next = least
                tail = least
            } else {
                head = least
                tail = least
            }
        }
        index = minimumNodeIndex(allLists)
    }
    return head
}

func minimumNodeIndex(_ lists: [ListNode?]) -> Int {
    
    var minValue = Int.max
    var index = -1
    
    for i in 0 ..< lists.count {
        guard let node = lists[i] else { continue }
        if node.val < minValue {
            minValue = node.val
            index = i
        }
    }
    return index
}
