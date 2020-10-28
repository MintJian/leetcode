// Simple
//class Solution {
//    func reverseWords(_ s: String) -> String {
//        return s.split(separator: " ").reversed().joined(separator: " ")
//    }
//}

//faster method, which simplified function String.SubSequence.reversed()
class Solution {
    func reverseWords(_ s: String) -> String {
        var wordList: [String.SubSequence] = s.split(separator: " ")
        var finalString:String = ""
        
        while !wordList.isEmpty {
            finalString += wordList.popLast()!
            finalString.append(" ")
        }
        
        if finalString != "" {
            finalString.removeLast()
        }
        
        return finalString
    }
}

//more fast
class Solution {
    func reverseWords(_ s: String) -> String {
        if s == "" { return "" }
        var wordArray = s.split(separator: " ")
        if wordArray.isEmpty { return "" }
        
        for i in 0..<wordArray.count / 2 {
            wordArray.swapAt(i, wordArray.count - 1 - i)
        }
        
        return wordArray.joined(separator: " ")
    }
}


