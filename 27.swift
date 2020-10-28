class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        while nums.contains(val) {
            nums.remove(at: nums.firstIndex(of: val)!)
        }
        return nums.count
    }
}

//皮一下哈哈
//执行击败96.82%，内存击败100%
