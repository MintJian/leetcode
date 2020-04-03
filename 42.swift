class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty || height.count == 1 || height.count == 2 {
            return 0
        }
        
        var leftMax: Int = height.first ?? 0
        var rightMax: Int = height.last ?? 0
        var nowValue: Int = 0
        var leftNow: Int = 0
        var rightNow: Int = height.count - 1
        
        while leftNow < rightNow {
            if leftMax > rightMax {
                rightNow -= 1
                if height[rightNow] > rightMax {
                    rightMax = height[rightNow]
                } else {
                    nowValue += rightMax - height[rightNow]
                }
            } else {
                leftNow += 1
                if height[leftNow] > leftMax {
                    leftMax = height[leftNow]
                } else {
                    nowValue += leftMax - height[leftNow]
                }
            }
        }
        return nowValue
    }
}
