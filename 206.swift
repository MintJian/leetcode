//2020.5
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
        var tail = head
        var newList: ListNode? = nil
        
        while tail != nil {
            let now = ListNode(tail!.val)
            now.next = newList
            newList = now
            tail = tail!.next
        }
        
        return newList
    }
}



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
