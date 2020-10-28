class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty || k > nums.count {
            return 0
        }
        var oddPlace:[Int] = [-1]
        var niceAmount:Int = 0
        
        for i in 0...nums.count - 1 {
            if nums[i] % 2 != 0 {
                oddPlace.append(i)
            }
        }
        
        if k > oddPlace.count {
            return 0
        }
        
        oddPlace.append(nums.count)
        
        for i in stride(from: 1, to: oddPlace.count - k, by: 1) {
            niceAmount += (oddPlace[i] - oddPlace[i - 1]) * (oddPlace[i + k] - oddPlace[i + k - 1])
        }
        
        return niceAmount
    }
}
