class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s == "" {
            return s
        }
        
        var pointA:Int = 0, pointB:Int = 0
        let arrayOfChar = Array(s)
        
        for i in 0...s.count - 1 {
            let lenA = expandAroundCenter(s: arrayOfChar, left: i, right: i)
            let lenB = expandAroundCenter(s: arrayOfChar, left: i, right: i + 1)
            
            let longer = max(lenA, lenB)
            if longer > pointB - pointA {
                pointA = i - (longer - 1) / 2
                pointB = i + longer / 2
            }
            
        }
        
        return String(arrayOfChar[pointA...pointB])
    }
    
    func expandAroundCenter(s: [String.Element], left: Int, right: Int) -> Int {
        var pointA = left, pointB = right
        
        while pointA >= 0 && pointB <= s.count - 1 {
            if s[pointA] != s[pointB] {
                break
            }
            pointA -= 1
            pointB += 1
        }
        
        return pointB - pointA - 1
    }
}

