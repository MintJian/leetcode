/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {return nil}

        var pSet = Set<Int>()
        traverse(root, true, q!.val)
        traverse(root, false, p!.val)

        for i in pList {
            pSet.insert(i.val)
        }
        for i in qList {
            if pSet.contains(i.val) {
                return i
            }
        }

        return nil
    }
    var pList = [TreeNode]()
    var qList = [TreeNode]()

    func traverse(_ root: TreeNode?, _ isQ: Bool, _ value: Int) -> Bool {
        if root == nil { return false }

        let left = traverse(root!.left, isQ, value)
        let right = traverse(root!.right, isQ, value)

        let hasValue = left || right || root!.val == value

        if hasValue {
            if isQ {
                qList.append(root!)
            } else {
                pList.append(root!)
            }
        }

        return hasValue
    }
}
