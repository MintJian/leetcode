class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return []}
        var point = root
        var stack = [TreeNode]()
        var answer = [Int]()

        while !stack.isEmpty || point != nil {
            while point != nil {
                stack.append(point!)
                point = point!.left
            }
            if !stack.isEmpty {
                point = stack.popLast()!
                answer.append(point!.val)
                point = point!.right
            }
        }

        return answer
    }
}
