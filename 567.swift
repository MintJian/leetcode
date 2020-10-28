class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        if s1 == "" { return true }

        var s1CharFrequency = [Int](repeating: 0, count: 26)
        var s2CharFrequency = [Int](repeating: 0, count: 26)
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        let aValue = "a".first!.asciiValue!

        for i in 0...s1.count - 1 {
            s1CharFrequency[Int(s1Array[i].asciiValue! - aValue)] += 1
            s2CharFrequency[Int(s2Array[i].asciiValue! - aValue)] += 1
        }
        
        for i in stride(from: s1.count, to: s2.count, by: 1) {
            if s1CharFrequency == s2CharFrequency { return true }
            s2CharFrequency[Int(s2Array[i].asciiValue! - aValue)] += 1
            s2CharFrequency[Int(s2Array[i - s1.count].asciiValue! - aValue)] -= 1
        }
        
        return s1CharFrequency == s2CharFrequency
    }
}
