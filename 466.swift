class Solution {
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
        if s1.isEmpty { return 0 }
        var s1Count:Int = 0, s2Count:Int = 0, index:Int = 0
        var recall: [Int : Dictionary<Int, Int>] = [:]
        var preLoop: KeyValuePairs<Int, Int> = [:]
        var inLoop: KeyValuePairs<Int, Int> = [:]
        
        
        while true {
            s1Count += 1
            for char in s1 {
                if char == s2[s2.index(s2.startIndex, offsetBy: index)] {
                    index += 1
                    if index == s2.count {
                        s2Count += 1
                        index = 0
                    }
                }
            }
            
            if s1Count == n1 {
                return s2Count / n2
            }
            
            if recall[index] != nil {
                let s1CountPrime:Int = recall[index]!.first!.key
                let s2CountPrime:Int = recall[index]!.first!.value
                preLoop = [s1CountPrime : s2CountPrime]
                inLoop = [s1Count - s1CountPrime : s2Count - s2CountPrime]
                break
            } else {
                recall.updateValue([s1Count : s2Count], forKey: index)
            }
        }
        
        var answer = preLoop.first!.value + (n1 - preLoop.first!.key) / inLoop.first!.key * inLoop.first!.value
        let rest = (n1 - preLoop.first!.key) % inLoop.first!.key
        
        if rest > 0 {
            for _ in 0...rest - 1 {
                for char in s1 {
                    if char == s2[s2.index(s2.startIndex, offsetBy: index)] {
                        index += 1
                        if index == s2.count {
                            answer += 1
                            index = 0
                        }
                    }
                }
            }
        }
        return answer / n2
    }
}
