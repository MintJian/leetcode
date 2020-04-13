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
        if l1 == nil || l2 == nil {
            if l1 == nil && l2 == nil {
                return nil
            } else {
                return l1 == nil ? l2 : l1
            }
        }
        if l1!.val == 0 {
            return l2
        }
        if l2!.val == 0 {
            return l1
        }
        var result:ListNode? = nil
        
        var number1:[Int] = []
        var number2:[Int] = []
        
        var point1: ListNode? = l1
        var point2: ListNode? = l2

        var doCarry:Bool = false
        
        while point1 != nil {
            number1.insert(point1!.val,at: 0)
            point1 = point1!.next
        }
        while point2 != nil {
            number2.insert(point2!.val, at: 0)
            point2 = point2!.next
        }
        
        while !number1.isEmpty || !number2.isEmpty {
            let node = ListNode(0)
            if !number1.isEmpty {
                node.val += number1.removeFirst()
            }
            if !number2.isEmpty {
                node.val += number2.removeFirst()
            }
            if doCarry {
                node.val += 1
            }
            if node.val > 9 {
                doCarry = true
                node.val -= 10
            } else {
                doCarry = false
            }
            
            node.next = result
            result = node
        }
        
        if doCarry {
            let node:ListNode = ListNode(1)
            node.next = result
            result = node
        }
        
        return result
    }
}
