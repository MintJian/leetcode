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

