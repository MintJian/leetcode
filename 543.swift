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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        
        if root != nil {
            getDepthOf(rootNode: root)
        }
        
        return diameter
    }
    
    var diameter: Int = 0
    
    func getDepthOf(rootNode: TreeNode?) -> Int {
        var depth = -1
        
        if rootNode != nil {
            let leftDepth = getDepthOf(rootNode: rootNode?.left) + 1
            let rightDepth = getDepthOf(rootNode: rootNode?.right) + 1
            
            diameter = max(diameter, leftDepth + rightDepth)
            depth = max(leftDepth, rightDepth)
        }
        
        return depth
    }
}
