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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        
        var point = [ListNode?](repeating: ListNode(-1), count: lists.count)
        let answer = ListNode(-1)
        var tail = answer
        var movableCount = lists.count
        
        for i in 0...point.count - 1 {
            point[i] = lists[i]
            if lists[i] == nil {
                movableCount -= 1
            }
        }
    
        if movableCount == 0 { return nil }
        while movableCount > 0 {
            var minPlace = [Int]()
            var minVal = Int.max
            for i in 0...point.count - 1 {
                if point[i] != nil {
                    let nowVal = point[i]!.val
                    if nowVal == minVal {
                        minPlace.append(i)
                    } else if nowVal < minVal {
                        minPlace = [i]
                        minVal = nowVal
                    }
                }
            }
            
            for i in minPlace {
                tail.next = ListNode(minVal)
                tail = tail.next!
                point[i] = point[i]!.next
                if point[i] == nil {
                    movableCount -= 1
                }
            }
        }
        
        return answer.next
    }
}
