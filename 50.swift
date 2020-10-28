class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 1 || n == 0 { return 1}
        let safeN = Int64(n)
        var answer = Double()
        if safeN > 0 {
            answer = doDivide(x, safeN)
        } else {
            answer = 1.0 / doDivide(x, -safeN)
        }
        return answer
    }

    private func doDivide(_ x: Double, _ n: Int64) -> Double {
        if n == 0 { return 1 }
        var answer = Double(1)
        let privious = doDivide(x, n / 2)
        if n % 2 == 0 {
            answer = privious * privious
        } else {
            answer = privious * privious * x
        }
        return answer
    }
}
