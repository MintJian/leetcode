class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        if A.count == 0 || A.count == 1 {
            return 0
        }
        
        var array = A.sorted(by: <)
        var count: Int = 0
        
        for i in 0...array.count - 2 {
            if array[i] >= array[i + 1] {
                count += array[i] - array[i + 1] + 1
                array[i + 1] += array[i] - array[i + 1] + 1
            }
        }
        return count
    }
}
