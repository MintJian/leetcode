class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x > 0 {
            var origin:Int = x
            var reversed:Int = 0
            while origin > 0{
                reversed = reversed * 10 + origin % 10
                origin /= 10
            }
            if reversed == x {
                return true
            }
        } else if x == 0 {
            return true
        }
        return false
    }
}

