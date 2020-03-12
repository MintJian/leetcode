//建议打表

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        if n == 2 {
            return "11"
        }
        var point:String = ""
        var string:String = "11"
        var pre:String = ""
        var time:Int = 0
        var nowLine:String = ""
        
        
        for i in 3...n {
            string += " "
            for i in 0...string.count - 1 {
                if i == 0 {
                    pre = String(string.first!)
                    time += 1
                } else {
                    point = String(string[string.index(string.startIndex, offsetBy: i)])
                    if point != pre {
                        nowLine += String(time)
                        nowLine += pre
                        pre = point
                        time = 1
                    } else {
                        time += 1
                    }
                }
            }
            pre = ""
            time = 0
            string = nowLine
            nowLine = ""
        }
        return string
    }
}
