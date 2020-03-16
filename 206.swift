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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var point = head
        var newList: ListNode?
        
        while point != nil {
            let newNode = ListNode(point!.val)
            newNode.next = newList
            point = point?.next
            newList = newNode
        }
        
        return newList
    }
}
