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
func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let leftMin = getMinDepth(root: root!.left)
        let rightMin = getMinDepth(root: root!.right)

        if root!.left == nil && root!.right != nil  {
            return rightMin + 1
        }
        if root!.right == nil && root!.left != nil {
            return leftMin + 1
        }

        return min(leftMin, rightMin) + 1
    }
    
    func getMinDepth(root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var minDepth = 0
        let leftMin = getMinDepth(root: root?.left) 
        let rightMin = getMinDepth(root: root?.right) 

        if root!.left == nil && root!.right != nil  {
            return rightMin + 1
        }
        if root!.right == nil && root!.left != nil {
            return leftMin + 1
        }

        return min(leftMin, rightMin) + 1
    }
    
}
