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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        travese(root: root?.left, isLeft: true)
        travese(root: root?.right, isLeft: false)
        
        return leftValList == rightValList && leftNilList == rightNilList
    }
    
    var leftValList:[Int] = []
    var leftNilList:[Bool] = []
    var rightValList:[Int] = []
    var rightNilList:[Bool] = []
    
    func travese(root: TreeNode?, isLeft: Bool) {
        if root == nil {
            if isLeft {
                leftNilList.append(false)
            } else {
                rightNilList.append(false)
            }
            return
        }
        if isLeft {
            leftNilList.append(true)
            leftValList.append(root!.val)
            travese(root: root!.left, isLeft: isLeft)
            travese(root: root!.right, isLeft: isLeft)
        } else {
            rightNilList.append(true)
            rightValList.append(root!.val)
            travese(root: root!.right, isLeft: isLeft)
            travese(root: root!.left, isLeft: isLeft)
        }
    }
}

