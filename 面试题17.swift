class Solution {
    func massage(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        if nums.count == 1 {
            return nums.first!
        }
        
        var doNotAdd: Int = 0
        var doAdd: Int = nums[0]
        
        for i in 1...nums.count - 1 {
            let wontAddThis = max(doNotAdd, doAdd)
            let willAddThis = doNotAdd + nums[i]
            
            doNotAdd = wontAddThis
            doAdd = willAddThis
        }
        
        return max(doNotAdd, doAdd)
    }
}
