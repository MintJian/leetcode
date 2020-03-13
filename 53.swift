class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var array = nums
        var maxSum = nums.first ?? 0
        if array.count > 1 {
            for i in 1...array.count - 1 {
                if array[i - 1] > 0 {
                    array[i] += array[i - 1]
                }
                maxSum = max(array[i], maxSum)
            }
        }
        return maxSum
    }
}
