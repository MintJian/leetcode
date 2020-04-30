class Solution {
    func isHappy(_ n: Int) -> Bool {
        var flag = false
        var dictionary: [Int : Bool] = [:]
        var now = n
        
        while !flag {
            if now == 1 {
                return true
            }
            if dictionary[now] != nil {
                flag = true
                break
            }
            dictionary.updateValue(true, forKey: now)
            let thisTurn = String(now)
            now = 0
            
            for i in thisTurn {
                let nowWord = Int(String(i))!
                now += nowWord * nowWord
            }
        }
        
        return false
    }
}

