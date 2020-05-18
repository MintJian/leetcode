class Solution {
    func validPalindrome(_ s: String) -> Bool {
        if s.isEmpty { return true }
        var arrayOfS = Array(s)
        var left = 0, right = arrayOfS.count - 1
        var valid = true
 
        while left < right {
            if arrayOfS[left] == arrayOfS[right] {
                left += 1
                right -= 1
            } else {
                var status1 = true, status2 = true
                for i in 0...(right - left) / 2 {
                    if arrayOfS[left + 1 + i] != arrayOfS[right - i] {
                        status1 = false
                    }
                    if arrayOfS[left + i] != arrayOfS[right - 1 - i] {
                        status2 = false
                    }
                    if !status1 && !status2 {
                        break
                    }
                }
                valid = (status1 || status2)
                break
            }
        }
        return valid
    }
}
