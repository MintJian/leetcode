class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        return dp(K: K, N: N)

    }
    
    var dictionary: [Int : Int] = [:]
    func dp(K: Int, N: Int) -> Int {
        var value: Int? = dictionary[N * 100 + K]
        if value == nil {
            var answer: Int = 0
            if N == 0 {
                answer = 0
            } else if K == 1 {
                answer = N
            } else {
                var start:Int = 1
                var end:Int = N
                
                while start + 1 < end {
                    let mid: Int = (start + end) / 2
                    let isDoBreak = dp(K: K - 1, N: mid - 1)
                    let isNotBreak = dp(K: K, N: N - mid)
                    
                    if isDoBreak < isNotBreak {
                        start = mid
                    } else {
                        end = mid
                        if isDoBreak == isNotBreak {
                            start = end
                        }
                    }
                }
                answer = 1 + min(max(dp(K: K - 1, N: start - 1), dp(K: K, N: N - start)), max(dp(K: K - 1, N: end - 1), dp(K: K, N: N - end)))
            }
            dictionary.updateValue(answer, forKey: N * 100 + K)
            value = answer
        }
        
        return value!
    }
}
