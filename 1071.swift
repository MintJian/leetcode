//内存消耗 :20.1 MB, 在所有 Swift 提交中击败了100.00%的用户
class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        var longStr = "", shortStr = ""
        if str1.count > str2.count{
            longStr = str1
            shortStr = str2
        } else {
            longStr = str2
            shortStr = str1
        }
        
        var remainStr = shortStr
        while !remainStr.isEmpty {
            if isGCD(subStr: remainStr, string: shortStr) && isGCD(subStr: remainStr, string: longStr) {
                return remainStr
            }
            
            remainStr = String(remainStr.dropLast())
        }
        
        return ""
    }
    
    func isGCD(subStr: String, string: String) -> Bool {
        var remain:String = string
        if string.count % subStr.count != 0 {
            return false
        }
        
        for i in 0...remain.count / subStr.count - 1 {
            
            let cut:String = String(remain[remain.startIndex...remain.index(remain.startIndex, offsetBy: subStr.count - 1)])
            if !(cut == subStr) {
                return false
            }
            
            if(remain.count != cut.count){
                remain = String(remain[remain.index(remain.startIndex, offsetBy: subStr.count)...remain.index(remain.startIndex, offsetBy: remain.count - 1)])
            }
        }
        return true
    }
}
