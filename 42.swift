class Solution {
    func trap(_ height: [Int]) -> Int {
        if height == [] || height.count == 1 {
            return 0
        }
        
        var pointA:Int = 0, pointB:Int = height.count - 1
        var leftMax:Int = 0, rightMax:Int = 0
        var result:Int = 0
        
        while pointA <= pointB {
            if leftMax < rightMax {
                if height[pointA] >= leftMax {
                    leftMax = height[pointA]
                } else {
                    result += leftMax - height[pointA]
                }
                pointA += 1
            } else {
                if height[pointB] >= rightMax {
                    rightMax = height[pointB]
                } else {
                    result += rightMax - height[pointB]
                }
                pointB -= 1
            }
        }
        return result
    }
}

