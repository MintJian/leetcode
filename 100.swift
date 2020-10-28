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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var isSame = true
        
        preOrderTraverse(p: p, isP: true)
        preOrderTraverse(p: q, isP: false)
        
        
        if qVal != pVal || qLeft != pLeft || qRight != pRight {
            return false
        }
        
        
        return isSame
    }
    
    var pVal: [Int] = []
    var qVal: [Int] = []
    
    public var pLeft: [Bool] = []
    public var qLeft: [Bool] = []
    
    public var qRight: [Bool] = []
    public var pRight: [Bool] = []
    
    func preOrderTraverse(p: TreeNode?, isP: Bool) {
        if p == nil {
            return
        }
        
        if isP {
            pVal.append(p!.val)
            pLeft.append(p!.left != nil)
            pRight.append(p!.right != nil)
        } else {
            qVal.append(p!.val)
            qLeft.append(p!.left != nil)
            qRight.append(p!.right != nil)
        }
        
        preOrderTraverse(p: p?.left, isP: isP)
        preOrderTraverse(p: p?.right, isP: isP)
    }
}

