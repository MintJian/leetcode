class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var set = Set<Int>()
        var longest = 0
        
        for i in nums {
            set.insert(i)
        }
        
        for i in set {
            if !set.contains(i - 1) {
                var now = i
                var long = 1
                
                while set.contains(now + 1) {
                    now += 1
                    long += 1
                }
                
                longest = max(long, longest)
            }
        }
        
        return longest
    }
}
