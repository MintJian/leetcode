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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        
        return generateBinaryTree(leftPoint: 0, rightPoint: nums.count - 1, nums: nums)
    }
    
    func generateBinaryTree(leftPoint: Int, rightPoint: Int, nums: [Int]) -> TreeNode? {
        if leftPoint > rightPoint {
            return nil
        }
        
        let midPoint = (leftPoint + rightPoint) / 2
        
        let root = TreeNode(nums[midPoint])
        root.left = generateBinaryTree(leftPoint: leftPoint, rightPoint: midPoint - 1, nums: nums)
        root.right = generateBinaryTree(leftPoint: midPoint + 1, rightPoint: rightPoint, nums: nums)
        
        return root
    }
}
