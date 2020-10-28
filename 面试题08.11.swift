class Solution {
    func waysToChange(_ n: Int) -> Int {
        if n == 0 { return 1 }
        
        let max = 1000000007
        let count:[Int] = [25, 10 ,5 ,1]
        var methods = [Int](repeating: 0, count: n + 1)
        methods[0] = 1
        
        for i in count {
            for j in stride(from: i, to: n + 1, by: 1) {
                methods[j] = (methods[j] + methods[j - i]) % max
            }
        }
        
        return methods[n]
    }
}
