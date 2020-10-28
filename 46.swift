class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[]] }
        var answer = [[nums.first!]]
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            var newList = [[Int]]()
            for j in stride(from: 0, to: answer.count, by: 1) {
                for k in stride(from: 0, to: answer[j].count + 1, by: 1) {
                    var line = answer[j]
                    line.insert(nums[i], at: k)
                    newList.append(line)
                }
            }
            answer = newList
        }
        
        return answer
    }
}
