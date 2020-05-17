class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxValue = nums[0]
        var nowProductMax = maxValue
        var nowProductMin = maxValue
        for i in 1..<nums.count {
            let nowMax = nowProductMax
            nowProductMax = max(nowMax * nums[i], nums[i], nowProductMin * nums[i])
            nowProductMin = min(nowMax * nums[i], nums[i], nowProductMin * nums[i])
            maxValue = max(nowProductMax, maxValue)
        }
        return maxValue
    }
}
