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
    private var sNodes = [Int]()
    private var tNodes = [Int]()
    
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil { return t == nil ? true : false}
        if t == nil { return false }
        preOrderTraverse(s, isSTree: true)
        preOrderTraverse(t, isSTree: false)
        
        if sNodes.count < tNodes.count {
            return false
        }
        
        for i in 0...sNodes.count - tNodes.count {
            if sNodes[i...i + tNodes.count - 1] == tNodes[0...tNodes.count - 1] {
                return true
            }
        }
        
        return false
    }
    
    func preOrderTraverse(_ root: TreeNode?, isSTree: Bool) {
        if root == nil {
            return
        }
        
        let hashData = String("\(root!.val) + \(root!.left == nil) + \(root!.right == nil)").hashValue
        if isSTree {
            sNodes.append(hashData)
        } else {
            tNodes.append(hashData)
        }
        
        preOrderTraverse(root!.left, isSTree: isSTree)
        preOrderTraverse(root!.right, isSTree: isSTree)
    }
}
