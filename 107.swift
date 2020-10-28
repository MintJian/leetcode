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
 **/
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        traverseBegin(root: root, depth: 0)
        
        var arrayOfEachLevel = [[Int]](repeating: [], count: dictionary.count)
        
        for (i, j) in dictionary {
                arrayOfEachLevel[dictionary.count - i - 1] = j
        }
        
        return arrayOfEachLevel
        
    }
        var dictionary:[Int:[Int]] = [:]
    
    func traverseBegin(root: TreeNode?, depth: Int) {
        if root == nil {
            return
        }
        
        
        var thisDepthArray:[Int] = (dictionary[depth]) ?? []
        thisDepthArray.append(root!.val)
        
        dictionary.updateValue(thisDepthArray, forKey: depth)
        
        
        traverseBegin(root: root?.left, depth: depth + 1)
        traverseBegin(root: root?.right, depth:  depth + 1)
    }
}

