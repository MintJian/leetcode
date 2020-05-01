class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.isEmpty || nums.count == 1 { return nums.count }
        var now = 1
        var maxLen = 1
        
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                now += 1
            } else {
                now = 1
            }
            maxLen = max(maxLen, now)
        }
        
        return maxLen
    }
}


