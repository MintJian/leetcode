class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var pointA:Int = 0, pointB:Int = height.count - 1
        var leftMax:Int = height.first!
        var rightMax:Int = height.last!
        var maxArea:Int = min(leftMax, rightMax) * (pointB - pointA)
        
        while pointA < pointB {
            if leftMax > rightMax {
                pointB -= 1
                if height[pointB] > rightMax {
                    rightMax = height[pointB]
                    maxArea = max(maxArea, min(leftMax, rightMax) * (pointB - pointA))
                }
            } else {
                pointA += 1
                if height[pointA] > leftMax {
                    leftMax = height[pointA]
                    maxArea = max(maxArea, min(leftMax, rightMax) * (pointB - pointA ))
                }
            }
        }
        
        return maxArea
    }
}

