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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
        if l1!.val == 0 && l1!.next == nil || l2!.val == 0 && l2!.next == nil { return l1!.val == 0 ? l2 : l1 }
        
        var point1 = l1, point2 = l2
        var carry = false
        let answer = ListNode(-1)
        var tail = answer
        while point1 != nil || point2 != nil {
            tail.next = ListNode((point1 ?? ListNode(0)).val  + (point2 ?? ListNode(0)).val + (carry == true ? 1 : 0))
            if tail.next!.val > 9 {
                carry = true
                tail.next!.val -= 10
            } else {
                carry = false
            }
            tail = tail.next!
            point1 = point1?.next
            point2 = point2?.next
        }
        
        if carry == true {
            tail.next = ListNode(1)
        }
        
        return answer.next
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


