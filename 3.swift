//2020.5
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let arrayS = Array(s)
        var maxLen = 0
        var nowLen = 0
        var charSet = Set<Character>()
        
        for i in 0..<arrayS.count {
            let nowChar = arrayS[i]
            if !charSet.contains(nowChar) {
                nowLen += 1
                charSet.insert(nowChar)
            } else {
                for j in i - nowLen..<i {
                    let pointChar = arrayS[j]
                    if pointChar != nowChar {
                        charSet.remove(pointChar)
                        nowLen -= 1
                    } else {
                        break
                    }
                }
            }
            maxLen = max(maxLen, nowLen)
        }
        
        return maxLen
    }
}



class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestStr:String = ""
        var longestValue:Int = 0
        
        for nowChar in s {
            while longestStr.contains(nowChar) {
                longestStr.removeFirst()
            }
            longestStr.append(nowChar)
            
            longestValue = max(longestStr.count, longestValue)
        }
        
        return longestValue
    }
}

