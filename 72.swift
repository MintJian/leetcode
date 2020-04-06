class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1Count = word1.count
        let word2Count = word2.count
        
        if word1Count == 0 || word2Count == 0 {
            return word1Count + word2Count
        }
        
        var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: word2Count + 1), count: word1Count + 1)
        
        for i in 0...word1Count {
            dp[i][0] = i
        }
        
        for j in 0...word2Count {
            dp[0][j] = j
        }
        
        for i in 1...word1Count {
            for j in 1...word2Count {
                let left:Int = dp[i - 1][j] + 1
                let down:Int = dp[i][j - 1] + 1
                var leftDown:Int = dp[i - 1][j - 1]
                
                if word1[word1.index(word1.startIndex, offsetBy: i - 1)] != word2[word2.index(word2.startIndex, offsetBy: j - 1)] {
                    leftDown += 1
                }
                dp[i][j] = min(left, down, leftDown)
            }
        }
        
        return dp[word1Count][word2Count]
    }
}
