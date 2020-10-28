class Solution {
    func reverseWords(_ s: inout [Character]) {
        if s.count == 0 {
            return
        }
        
        reverseCharacters(&s, start: 0, end: s.count - 1)
        
        var record: Int = 0
        
        for i in 0...s.count - 1 {
            if s[i] == " " {
                reverseCharacters(&s, start: record, end: i - 1)
                record = i + 1
            }
        }
        
        reverseCharacters(&s, start: record, end: s.count - 1)

    }
    
    func reverseCharacters(_ s: inout [Character], start: Int, end: Int) {
        for i in start...start + (end - start) / 2{
            s.swapAt(i, end + start - i)
        }
    }
}
