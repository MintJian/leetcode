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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        preOrder(root: root, nowLevel: 0)
        return arrayOfEachLevel
    }

    var arrayOfEachLevel:[Int] = []

    func addToLevel(_ level:Int, data:Int) {
        let depth = arrayOfEachLevel.count - 1

        if depth < level {
            for _ in 1...level - depth{
                arrayOfEachLevel.append(0)
            }
        }
        arrayOfEachLevel[level] = data
    }

    func preOrder(root: TreeNode?, nowLevel:Int) {
        if root == nil {
            return
        }
        addToLevel(nowLevel, data: root!.val)
        let childLevel = nowLevel + 1
        preOrder(root: root!.left, nowLevel: childLevel)
        preOrder(root: root!.right, nowLevel: childLevel)
    }
}
