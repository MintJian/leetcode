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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
     if root == nil {
      return false
     }
    var nowSum = sum

    nowSum -= root!.val;
    if root!.left == nil && root!.right == nil {
      return (nowSum == 0);
    }
    return hasPathSum(root!.left, nowSum) || hasPathSum(root!.right, nowSum);
    }
}

