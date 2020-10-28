//执行用时 :0 ms, 在所有 Swift 提交中击败了100.00%的用户
//内存消耗 :19.6 MB, 在所有 Swift 提交中击败了100.00%的用户

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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var midPoint = head
        var nowPoint = head
        var time = 0
        
        while nowPoint != nil {
            if time != 0 && time % 2 == 0 {
                midPoint  = midPoint?.next
            }
            nowPoint = nowPoint?.next
            time += 1
        }
        if time != 0 && time % 2 == 0 {
            midPoint  = midPoint?.next
        }
        return midPoint
    }
}
