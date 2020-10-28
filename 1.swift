class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary: [Int : Int] = [:]
        
        for i in 0...nums.count - 1 {
                dictionary.updateValue(i, forKey: nums[i])
        }
        
        for i in 0...nums.count - 1 {
            let number = dictionary[target - nums[i]] ?? i
            if number != i {
                return [i, number]
            }
        }
        return []
    }
}
