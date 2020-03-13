class Solution {
    func mySqrt(_ x: Int) -> Int {
        for i in 0...x {
            if (i * i < x && (i+1) * (i+1) > x) || (i * i == x) {
                return i
            }
        }
        return 0
    }
}

