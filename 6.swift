class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 1 || s == "" {
            return ""
        }
        if numRows == 1 {
            return s
        }
        var strMap: [String] = [String](repeating: "", count: numRows)
        var remainS: String = String(Array(s.reversed()))
        var nowLine: Int = 0
        var isDown: Bool = false
        var final: String = ""
        
        while remainS != "" {
            if nowLine == 0 || nowLine == numRows - 1 {
                isDown = !isDown
            }
            strMap[nowLine].append(remainS.popLast()!)
            if isDown {
                nowLine += 1
            } else {
                nowLine -= 1
            }
        }
        
        for i in strMap {
            final += i
        }
        
        return final
    }
}
