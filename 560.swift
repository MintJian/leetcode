class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var history = [0:1]
        var priviousValue = 0
        for i in 0..<nums.count {
            priviousValue += nums[i]
            let priviousTime = history[priviousValue - k]
            if priviousTime != nil {
                count += priviousTime!
            }
            let previousCount = history[priviousValue] ?? 0
            history.updateValue(previousCount + 1, forKey: priviousValue)
        }
        return count
    }
}
