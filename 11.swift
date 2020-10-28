class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var leftPoint:Int = 0
        var rightPoint:Int = height.count - 1
        var leftMax = height[0]
        var rightMax = height[height.count - 1]
        var maxVolume:Int = min(leftMax, rightMax) * (rightPoint - leftPoint)
        
        while leftPoint != rightPoint {
            if leftMax > rightMax {
                rightPoint -= 1
                rightMax = max(rightMax, height[rightPoint])
                maxVolume = max(maxVolume, min(leftMax, rightMax) * (rightPoint - leftPoint))
            } else {
                leftPoint += 1
                leftMax = max(leftMax, height[leftPoint])
                maxVolume = max(maxVolume, min(leftMax, rightMax) * (rightPoint - leftPoint))
            }
        }
        
        return maxVolume
    }
}
