class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: String = ""
        var string:String = s
        
        while !string.isEmpty {
            if string.last == "}" || string.last == "]" || string.last == ")" {
                stack.append(string.popLast()!)
            } else {
                if stack.isEmpty {
                    return false
                }
                switch stack.last {
                case "}":
                    if string.last != "{" {
                        return false
                    } else {
                        string.popLast()
                        stack.popLast()
                    }
                    break
                case "]":
                    if string.last != "[" {
                        return false
                    } else {
                        string.popLast()
                        stack.popLast()
                    }
                    break
                case ")":
                    if string.last != "(" {
                        return false
                    } else {
                        string.popLast()
                        stack.popLast()
                    }
                    break
                default:
                    return false
                }
            }
        }
        if !stack.isEmpty {
            return false
        }
        
        return true
    }
}

