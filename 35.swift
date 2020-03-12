class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int{
        if !nums.isEmpty {
            for i in 0...nums.count - 1 {
                if nums[i] >= target {
                    return i
                }
            }
        } else {
            return 0
        }
        
        return nums.count
    }
}

