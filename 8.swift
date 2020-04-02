class Solution {
    func myAtoi(_ str: String) -> Int {
        if str == "" {
            return 0
        }

        var strWithoutSpace: String = ""
        var isPositive: Bool = true

        let pass: String = "1234567890"
        var start: Bool = false

        for i in str {
            if i == " " {
                if start == true {
                    if strWithoutSpace != "" {
                        break
                    } else {
                        return 0
                    }
                }
                continue
            } else if i == "-" {
                if start && strWithoutSpace == ""{
                    return 0
                }
                if strWithoutSpace != "" {
                    break
                }
                start = true
                isPositive = false
            } else if i == "+" {
                if start && strWithoutSpace == ""{
                    return 0
                }
                if strWithoutSpace != "" {
                    break
                }
                start = true
                isPositive = true
            } else if pass.contains(i) {
                start = true
                strWithoutSpace += String(i)
            } else {
                if strWithoutSpace == "" {
                    return 0
                } else {
                    break
                }
            }
        }


        var data:(Array) = Array(strWithoutSpace)
        
        while data.first ?? "x" == "0" {
            data.removeFirst()
        }
        
        if data.isEmpty {
            return 0
        }
        
        if data.count > 10 {
            return Int(isPositive ? Int32.max : Int32.min)
        } else if data.count == 10 {
            if Int(String(data[0]))! > 2 {
                return Int(isPositive ? Int32.max : Int32.min)
            } else if Int(String(data[0]))! == 2 {
                if isPositive {
                    if Int(strWithoutSpace)! > Int32.max {
                        return Int(Int32.max)
                    }
                } else {
                    if Int(strWithoutSpace)! > Int(Int32.max) + 1 {
                        return Int(Int32.min)
                    }
                }
            }
        }
        
        var answer:Int = 0
        var now:Int = 1
        
        data = data.reversed()
        
        while !data.isEmpty {
            answer += Int(String(data.removeFirst()))! * now
            now *= 10
        }
        
        return isPositive ? answer : answer * -1
    }
}
