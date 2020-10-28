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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftDepth: Int = maxDepth(root?.left) + 1
        let rightDepth: Int = maxDepth(root?.right) + 1
        
        return leftDepth > rightDepth ? leftDepth : rightDepth
    }
}

