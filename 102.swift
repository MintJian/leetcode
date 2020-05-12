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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return []}
        var answer = [[Int]]()
        var stack = [root!]

        while !stack.isEmpty {
            var nowLine = [Int]()
            for i in 0..<stack.count {
                let now = stack.removeFirst()
                nowLine.append(now.val)
                if now.left != nil {
                    stack.append(now.left!)
                }
                if now.right != nil {
                    stack.append(now.right!)
                }
            }
            answer.append(nowLine)
        }
        return answer
    }
}
