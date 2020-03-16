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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            if l2 == nil {
                return nil
            } else {
                return l2
            }
        }

        if l2 == nil {
            return l1
        }

        var s1: String = "", s2:String = ""

        var point:ListNode? = l1

        while point != nil {
            s1 += String(point!.val)
            point = point?.next
        }

        point = l2
        while point != nil {
            s2 += String(point!.val)
            point = point?.next
        }

        var result:String = ""
        var carry:Int = 0
        
        s1 = String(s1.reversed())
        s2 = String(s2.reversed())

        while s1 != "" || s2 != "" {
            var nowNum:Int = Int(String(s1.popLast() ?? "0"))! + Int(String(s2.popLast() ?? "0"))! + carry

            if nowNum >= 10 {
                carry = 1
                nowNum -= 10
            } else {
                carry = 0
            }

            result.append(String(nowNum))
        }

        if carry == 1 {
            result.append(String(carry))
        }
        var reversedResult = String(result.reversed())
        
        let newList = ListNode(Int(String(reversedResult.popLast()!))!)
        
        point = newList
        while reversedResult != "" {
            point!.next = ListNode(Int(String(reversedResult.popLast()!))!)
            point = point?.next!
        }
        
        return newList
    }
}


