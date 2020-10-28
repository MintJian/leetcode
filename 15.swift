class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        
        let sortedNums:[Int] = nums.sorted()
        var result:[[Int]] = []
        
        for i in 0...sortedNums.count - 2 {

            if sortedNums[i] > 0 {
                break
            }

            if i >= 1 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }

            
            var pointA:Int = i + 1
            var pointB:Int = sortedNums.count - 1
            while pointA < pointB {
                if sortedNums[i] + sortedNums[pointA] + sortedNums[pointB] == 0 {
                    result.append([sortedNums[i], sortedNums[pointA], sortedNums[pointB]])
                
                while  pointA < pointB && sortedNums[pointA] == sortedNums[pointA + 1]{
                    pointA += 1
                }
                while  pointA < pointB && sortedNums[pointB] == sortedNums[pointB - 1]{
                    pointB -= 1
                }
                pointA += 1
                pointB -= 1
                } else if sortedNums[i] + sortedNums[pointA] + sortedNums[pointB] > 0 {
                    pointB -= 1
                } else {
                    pointA += 1
                }
            }
        }
        
        return result
    }
}
