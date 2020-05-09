class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var stack = [root!]
        var answer = [Int]()
        
        while !stack.isEmpty {
            let node = stack.popLast()!
            answer.append(node.val)
            if node.left != nil {
                stack.append(node.left!)
            }
            if node.right != nil {
                stack.append(node.right!)
            }
        }

        return answer.reversed()
    }
}
