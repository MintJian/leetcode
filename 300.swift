 class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums == [] {
            return 0
        }
        if nums.count == 1 {
            return 1
        }
        
        var maxLength = [Int](repeating: 1, count: nums.count)
        var nowMax:Int = 0
        
        for i in 0...nums.count - 1 {
            nowMax = 0
            for j in 0...i {
                if nums[i] > nums[j] {
                    nowMax = max(nowMax, maxLength[j])
                }
                
            }
            maxLength[i] = nowMax + 1
            
        }
        
        return maxLength.max()!
    }
 }
