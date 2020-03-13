class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if nums1.count == 0 || m == 0 {
            nums1 = nums2
            return
        }
        var realNums1 = nums1[0...m - 1]
        realNums1 += nums2
        realNums1.sort()
        for i in 0...realNums1.count - 1 {
            nums1[i] = realNums1[i]
        }
    }
}

