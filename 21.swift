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


//2020.5
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1p = l1
        var l2p = l2
        let result = ListNode(-1)
        var tail = result
        
        while l1p != nil || l2p != nil {
            let l1pValue = l1p?.val ?? Int.max
            let l2pValue = l2p?.val ?? Int.max
            
            if l1pValue < l2pValue {
                tail.next = ListNode(l1pValue)
                l1p = l1p?.next
            } else {
                tail.next = ListNode(l2pValue)
                l2p = l2p?.next
            }
            tail = tail.next!
        }
        
        return result.next
    }
}



//2020.3
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        var newList: ListNode = ListNode(0)
        var list1Point = l1
        var list2Point = l2
        var newListPoint = newList
        
        while list1Point != nil && list2Point != nil {
            if list1Point!.val < list2Point!.val {
                newListPoint.next = list1Point
                list1Point = list1Point?.next
            } else if list2Point!.val < list1Point!.val {
                newListPoint.next = list2Point
                list2Point = list2Point?.next
            } else {
                newListPoint.next = list1Point
                list1Point = list1Point?.next
                newListPoint = newListPoint.next!
                newListPoint.next = list2Point
                list2Point = list2Point?.next
            }
            newListPoint = newListPoint.next!
        }
        
        if list1Point == nil {
            newListPoint.next = list2Point
            list2Point = list2Point?.next
        } else if list2Point == nil {
            newListPoint.next = list1Point
            list1Point = list1Point?.next
        }
        
        return newList.next
    }
}


//class Solution {
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var newList:ListNode?
//        var answer = [ListNode]()
//        var list1: ListNode?, list2:ListNode?
//        if l1 == nil || l2 == nil{
//            return l1 == nil ? l2 : l1
//        } else {
//            list1 = l1!
//            list2 = l2!
//            newList = ListNode(0)
//        }
//        
//        while list1 != nil || list2 != nil {
//            if list1 != nil && list2 != nil {
//                if list1!.val < list2!.val {
//                    newList = ListNode(list1!.val)
//                    list1 = list1?.next
//                } else if list2!.val < list1!.val {
//                    newList = ListNode(list2!.val)
//                    list2 = list2?.next
//                } else {
//                    newList = ListNode(list1!.val)
//                    answer.append(newList!)
//                    newList = newList?.next
//                    newList = ListNode(list2!.val)
//                    list1 = list1?.next
//                    list2 = list2?.next
//                }
//                answer.append(newList!)
//                newList = newList?.next
//            } else if list1 != nil {
//                while list1 != nil {
//                    newList = ListNode(list1!.val)
//                    list1 = list1?.next
//                    answer.append(newList!)
//                    newList = newList?.next
//                }
//            } else {
//                while list2 != nil {
//                    newList = ListNode(list2!.val)
//                    list2 = list2?.next
//                    answer.append(newList!)
//                    newList = newList?.next
//                }
//            }
//            
//        }
//        
//        for i in 0...answer.count - 2 {
//            answer[i].next = answer[i + 1]
//        }
//        
//        
//        return answer.isEmpty ? nil : answer.first
//    }
//}
//
