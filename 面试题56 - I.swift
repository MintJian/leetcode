class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var ret = 0, div = 1
        var a = 0, b = 0
        for i in nums {
            ret ^= i
        }
        
        while div & ret == 0 {
            div <<= 1
        }
        
        for i in nums {
            if div & i != 0 {
                a ^= i
            } else {
                b ^= i
            }
        }
        
        return[a, b]
    }
}

