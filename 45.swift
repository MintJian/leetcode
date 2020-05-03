class Solution {
    func jump(_ nums: [Int]) -> Int {
        var nowRemain = 1
        var nowPlace = -1
        var time = 0
        var nowMaxJump: [Int] = [-1, -1]
        
        
        while nowPlace < nums.count - 1 {
            nowRemain -= 1
            nowPlace += 1
            
            if nowPlace + nowRemain >= nums.count - 1 {
                return time
            }
            
            let nowStep = nums[nowPlace]
            
            if nowStep > nowMaxJump[1] + ( nowMaxJump[0] - nowPlace) {
                nowMaxJump = [nowPlace, nowStep]
            }

            if nowRemain == 0 {
                time += 1
                nowPlace = nowMaxJump[0]
                nowRemain = nowMaxJump[1]
            }
            
        }
        return time
    }
}
