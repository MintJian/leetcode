class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1.first! == "0" || num2.first! == "0" { return "0"}
        let remain1 = Array(num1)
        var remain2 = Array(num2)
        var carry: Int = 0
        var priviousLine = ""
        
        for i in 0..<remain2.count {
            let last = remain2.popLast()!
            var thisLine = ""
            for i in remain1.reversed() {
                var thisProcess = (Int(String(i))! * Int(String(last))!) + carry
                carry = thisProcess / 10
                thisProcess = thisProcess % 10
                thisLine = String(thisProcess) + thisLine
            }
            if carry != 0 {
                thisLine = String(carry) + thisLine
                carry = 0
            }
            
            if i != 0 {
                thisLine += String(repeating: "0", count: i)
            } else {
                priviousLine = thisLine
            }
            
            if i != 0 {
                var number1:String = priviousLine
                carry = 0
                var plus = ""
                while !(number1.isEmpty && thisLine.isEmpty) {
                    let cx = number1.popLast() ?? "0"
                    let cy = thisLine.popLast() ?? "0"
                    var res = Int(String(cx))! + Int(String(cy))! + carry
                    if res > 9 {
                        carry = 1
                        res -= 10
                    } else {
                        carry = 0
                    }
                    plus = String(res) + plus
                }
                priviousLine = plus
                if carry == 1 {
                    priviousLine = "1" + priviousLine
                    carry = 0
                }
            }
        }
        return priviousLine
    }
}
