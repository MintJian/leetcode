class Solution {
    func reverse(_ x: Int) -> Int {
        var answer = String(String(x).reversed())
        
        if x < 0 {
            answer.removeLast()
            answer = "-" + answer
        }
        
        return (Int64(answer)! > Int64(Int32.max) || Int64(answer)! < Int64(Int32.min)) ? 0 : Int(answer)!
    }
}

