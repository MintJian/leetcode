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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return []}
        var point: TreeNode? = root
        var stack = [TreeNode]()
        var answer = [Int]()

        while point != nil || !stack.isEmpty {
            while point != nil {
                answer.append(point!.val)
                stack.append(point!)
                point = point!.left
            }
            if !stack.isEmpty {
                point = stack.popLast()!
                point = point!.right
            }
        }

        return answer
    }
}
