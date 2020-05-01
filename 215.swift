class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var dictionary: [Int : Int] = [:]
        let sortedArray = nums.sorted(by: >)
        var uniqueArray = [sortedArray.first!]
        var count = 0
        
        for i in nums {
            let count = (dictionary[i] ?? 0) + 1
            dictionary.updateValue(count, forKey: i)
        }
        
        for i in 1..<sortedArray.count {
            if sortedArray[i] != sortedArray[i - 1] {
                uniqueArray.append(sortedArray[i])
            }
        }
        
        for i in uniqueArray {
            count += dictionary[i]!
            if count >= k {
                return i
            }
        }
        
        return -1
    }
}
