class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        var str = String()
        var result:[Bool] = []
        for i in strs.first! {
            str.append(i)
            var isEnd = true
            for i in strs {
                result.append(i.hasPrefix(str))
            }
            if result.contains(true) {
                if !result.contains(false) {
                    isEnd = false
                } else {
                    isEnd = true
                    str.popLast()
                }
            }
            if isEnd == true {
                break
            }
        }
        return str
    }
}

