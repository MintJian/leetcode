class Solution {
    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        if x + y < z {
            return false
        }

        if x == 0 || y == 0 {
            return z == 0 || x + y == z
        }
        
        return z % gcd(x: x, y: y) == 0
    }
    
    func gcd(x: Int, y: Int) -> Int {
        var a: Int = 0
        var b: Int = max(x, y)
        var r: Int = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        
        return b
    }
}

