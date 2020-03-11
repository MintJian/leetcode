class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var check: Int = 0
        if nums == [] {
            check -= 1
        }
        
        if nums.count > 1 {
            
            for i in 1...nums.count - 1 {
                if nums[check] != nums[i] {
                    check += 1
                    nums[check] = nums[i]
                    if check == nums.count - 1 {
                        break
                    }
                }
            }
        }
        print(nums)
        return check + 1
    }
}
