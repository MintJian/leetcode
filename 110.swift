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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        let heightDifference = abs(height(root: root?.left) - height(root: root?.right))
        
        return heightDifference <= 1 && isBalanced(root?.right) && isBalanced(root?.left)
    }
        
    func height(root: TreeNode?) -> Int {
        if root == nil {
            return -1
        }
        
        return max(height(root: root?.left), height(root: root?.right)) + 1
    }
}

