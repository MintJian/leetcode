class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return 0 }
        
        let _ = mergeSortWithCount(array: nums, left: 0, right: nums.count - 1)
        
        return reversePairsAmount
    }
    
    var reversePairsAmount:Int = 0
    
    func mergeSortWithCount(array: [Int], left: Int, right: Int) -> [Int] {
        if left == right - 1 {
            let leftNum = array[left], rightNum = array[right]
            if leftNum > rightNum {
                reversePairsAmount += 1
                return [rightNum, leftNum]
            } else {
                return [leftNum, rightNum]
            }
        }
        
        if left == right {
            return [array[left]]
        }
        
        var sortedArray: [Int] = []
        let mid = (left + right) / 2
        var rightMove:Int = 0
        var rightLast:Int = 0
        
        var sortedLeft = Array(mergeSortWithCount(array: array, left: left, right: mid).reversed())
        var sortedRight = Array(mergeSortWithCount(array: array, left: mid + 1, right: right).reversed())
        
        while !sortedLeft.isEmpty && !sortedRight.isEmpty {
            if sortedLeft.last! > sortedRight.last! {
                rightLast = sortedRight.popLast()!
                sortedArray.append(rightLast)
                rightMove += 1
            } else {
                reversePairsAmount += rightMove
                sortedArray.append(sortedLeft.popLast()!)
            }
        }
        
        while !sortedLeft.isEmpty {
            let leftLast = sortedLeft.popLast()!
            sortedArray.append(leftLast)
            reversePairsAmount += rightMove
        }
        while !sortedRight.isEmpty {
            rightLast = sortedRight.popLast()!
            sortedArray.append(rightLast)
        }
        
        return sortedArray
    }
}
