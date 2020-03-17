class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var nowNum = 0
        var dictionary: [String.Element:Int] = [:]
        
        for i in chars {
            dictionary.updateValue((dictionary[i] ?? 0) + 1, forKey: i)
        }
        
        for i in words {
            if i.count == 0 {
                continue
            }
        
            var nowDictionary = dictionary
            for j in 0...i.count - 1 {
                
                let nowWord:Character = Array(i)[j]
                if nowDictionary[nowWord] ?? 0 <= 0 {
                    break
                } else {
                    nowDictionary.updateValue(nowDictionary[nowWord]! - 1, forKey: nowWord)
                    if j == i.count - 1 {
                        nowNum += j + 1
                    }
                }
            }
        }
        return nowNum
    }
}
