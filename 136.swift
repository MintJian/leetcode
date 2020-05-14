class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var number = 0
        for i in nums {
            number = number ^ i
        }
        return number
    }
}
