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
    func sumNumbers(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return search(root, prefix: 0)
    }
    
    func search(_ root: TreeNode?, prefix: Int) -> Int {
        if root == nil { return 0 }
        var answer = 0
        let val = prefix * 10 + root!.val
        if root!.left == nil && root!.right == nil {
            return val
        } else {
            if root!.left != nil {
                answer += search(root!.left, prefix: val)
            }
            if root!.right != nil {
                answer += search(root!.right, prefix: val)
            }
        }
        return answer
    }
}
