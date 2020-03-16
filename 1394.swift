class Solution {
    func compressString(_ S: String) -> String {
        var newStr = ""
        var previousChar:String = ""
        var times = 0
        for i in S {
            if previousChar != String(i) {
                if newStr != "" {
                    newStr.append(String(times))
                    times = 1
                    newStr.append(i)
                    previousChar = String(i)
                } else {
                    times = 1
                    newStr.append(i)
                    previousChar = String(i)
                }
            } else {
                times += 1
            }
        }
        newStr.append(String(times))
        
        return newStr.count < S.count ? newStr : S
    }
}

