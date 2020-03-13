/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var point:ListNode? = head
        
        while point?.next != nil {
            if point?.val == point?.next!.val {
                point?.next = point?.next!.next
            } else {
                point = point?.next
            }
        }
        return head
    }
}

