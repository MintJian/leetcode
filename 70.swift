class Solution {
    func climbStairs(_ n: Int) -> Int {
        var now:Int = 1
        var pre:Int = 0
        for i in 1...n {
            let record = now
            now += pre
            pre = record
        }
        
        return now
    }
}

