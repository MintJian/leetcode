class Solution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        let arraySum:Int = A.reduce(0, +)
        var firstSum:Int = 0
        var secondSum:Int = 0
        for i in 0...(A.count - 1) {
            firstSum += A[i]
            if firstSum == arraySum / 3 {
                for j in (i + 1)...(A.count - 1) {
                    secondSum += A[j]
                    if secondSum == arraySum / 3 {
                        if j != A.count - 1 {
                            return true
                        } else  {
                            return false
                        }
                    }
                }
                secondSum = 0
            }
        }
        return false
    }
}

let s = Solution()
print(s.canThreePartsEqualSum([1,-1,1,-1]))

//执行用时 :
//500 ms, 在所有 Swift 提交中击败了78.57%的用户
//内存消耗 :
//21.2 MB, 在所有 Swift 提交中击败了100.00%的用户
