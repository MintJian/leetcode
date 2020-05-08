//2020.5
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 0, right = x
        
        while left <= right {
            let mid = (left + right) / 2
            if mid * mid <= x && (mid + 1) * (mid + 1) > x {
                return mid
            }
            if (mid + 1) * (mid + 1) == x {
                return mid + 1
            }
            if (mid + 1) * (mid + 1) < x {
                left = mid + 1
            }
            if mid * mid > x {
                right = mid - 1
            }
        }
        
        return -1
    }
}

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

