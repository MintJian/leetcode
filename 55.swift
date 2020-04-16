class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }
        var maxStep:Int = nums[0]
        
        for i in 0...nums.count - 1 {
            if maxStep == 0 {
                return false
            }
            maxStep = max(maxStep - 1, nums[i])
            
            guard i + maxStep < nums.count - 1 else {
                return true
            }
        }
        return true
    }
}
