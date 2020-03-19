class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var dictionary: [Character : Int] = [:]
        var answer: Int = 0

        for i in s {
            dictionary.updateValue((dictionary[i] ?? 0) + 1 , forKey: i )
        }
        var sortedDictionary = dictionary.sorted(by :{$0.1 > $1.1})

        for i in sortedDictionary {
            if i.value > 1 {
                var now = i.value
                if now % 2 != 0 {
                    now -= 1
                }
                while now >= 1 {
                    answer += 1
                    now -= 1
                }
            }
        }
        
        return answer < s.count ? answer + 1 : answer
    }
}
