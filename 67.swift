class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        var arrayA:[Int] = []
        var arrayB:[Int] = []
        
        var result:[Int] = []
        var answer = ""
        
        for i in a {
            arrayA.append(Int(String(i))!)
        }
        for i in b {
            arrayB.append(Int(String(i))!)
        }
        
        var advance = 0
        while !arrayA.isEmpty && !arrayB.isEmpty {
            result.insert(arrayA.popLast()! + arrayB.popLast()! + advance, at: 0)
            if result.first! >= 2 {
                result[0] -= 2
                advance = 1
            } else {
                advance = 0
            }
            answer.insert(String(result[0]).first!, at: answer.startIndex)
        }
        
        if arrayA.isEmpty {
            while !arrayB.isEmpty {
                result.insert(arrayB.popLast()! + advance, at: 0)
                if result.first! >= 2 {
                    result[0] -= 2
                    advance = 1
                } else {
                    advance = 0
                }
                answer.insert(String(result[0]).first!, at: answer.startIndex)
            }
        }
        
        if arrayB.isEmpty {
            while !arrayA.isEmpty {
                result.insert(arrayA.popLast()! + advance, at: 0)
                if result.first! >= 2 {
                    result[0] -= 2
                    advance = 1
                } else {
                    advance = 0
                }
                answer.insert(String(result[0]).first!, at: answer.startIndex)
            }
        }
        
        if advance == 1 {
            answer.insert("1", at: answer.startIndex)
        }
        
        return answer
    }
}
