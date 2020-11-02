class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var charSet = Set<Int>()
        var answer = Set<Int>()
        for number in nums1 {
            charSet.insert(number)
        }
        
        for number in nums2 {
            if charSet.contains(number) {
                answer.insert(number)
            }
        }
        
        return [Int](answer)
    }
}
