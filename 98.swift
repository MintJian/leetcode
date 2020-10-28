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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        rootVal = root!.val
        let _ = traverse(root: root!)
        return isValid
    }
    
    private var maxChildVal = Int.min
    private var childVal = 0
    private var isValid = true
    private var isRightOfRoot = false
    private var rootVal = 0
    private var rootIsTraversed = false
    
    func traverse(root: TreeNode) -> Int {
        if isValid == false { return Int.max }
        let selfVal = root.val
        
        if rootIsTraversed {
            if isRightOfRoot && selfVal <= rootVal {
                isValid = false
                return selfVal
            }
            
            if !isRightOfRoot && selfVal >= rootVal {
                isValid = false
                return selfVal
            }
        } else {
            rootIsTraversed = true
        }
        
        if maxChildVal >= selfVal {
            isValid = false
            return selfVal
        }
        
        if root.left != nil {
            let leftVal = traverse(root: root.left!)
            if leftVal >= selfVal {
                isValid = false
                return selfVal
            }
        }
        if selfVal == rootVal {
            isRightOfRoot = true
        }
        if root.right != nil {
            let rightVal = traverse(root: root.right!)
            if rightVal <= selfVal {
                isValid = false
                return selfVal
            }
        }
        
        maxChildVal = max(maxChildVal, root.right == nil ? selfVal : root.right!.val)
        return maxChildVal
    }
}


