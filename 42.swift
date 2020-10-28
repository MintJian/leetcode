//2020.05
class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 2 { return 0 }
        var leftMax = height[0], rightMax = height[height.count - 1]
        var leftPlace = 0, rightPlace = height.count - 1
        var amount = 0
        
        while leftPlace <= rightPlace {
            if leftMax > rightMax {
                rightPlace -= 1
                let rightNow = height[rightPlace]
                if rightNow >= rightMax {
                    rightMax = rightNow
                } else {
                    amount += rightMax - rightNow
                }
            } else {
                leftPlace += 1
                let leftNow = height[leftPlace]
                if leftNow >= leftMax {
                    leftMax = leftNow
                } else {
                    amount += leftMax - leftNow
                }
            }
        }
        
        return amount
    }
}


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
