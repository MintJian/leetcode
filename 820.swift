class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        if words == [] {
            return 0
        }
        
        let sortedWords = words.sorted(by: {$0.count > $1.count})
        var existWordsContains: [String:Bool] = [:]
        var length: Int = 0
        var amount: Int = 0
        
        print(sortedWords)
        
        for i in sortedWords {
            if !(existWordsContains[i] ?? false) {
                var temp: String = i
                var thisLine: String = ""
                for _ in i {
                    thisLine.insert(temp.popLast()!, at: thisLine.startIndex)
                    existWordsContains.updateValue(true, forKey: thisLine)
                }
                length += i.count
                amount += 1
            }
        }
        
        return amount + length
    }
}
