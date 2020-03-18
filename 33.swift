class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums == [] {
            return -1
        }
        
        if nums.count == 1 {
            if nums.first! == target {
                return 0
            } else {
                return -1
            }
        }
        
        let rotatePoint = findRotatePoint(nums: nums, start: 0, end: nums.count - 1)
        if rotatePoint == 0 {
            return binarySearch(nums: nums, start: 0, end: nums.count - 1, target: target)
        }
        
        if target < nums.first! {
            return binarySearch(nums: nums, start: rotatePoint, end: nums.count - 1, target: target)
        } else {
            return binarySearch(nums: nums, start: 0, end: rotatePoint - 1, target: target)
        }
    }
    
    func findRotatePoint(nums:[Int], start:Int, end:Int) -> Int {
        if nums[start] < nums[end] {
            return 0
        }
        
        var left = start, right = end
        while left <= right {
            let mid:Int = (left + right) / 2
            
            if nums[mid] > nums[mid + 1] {
                return mid + 1
            } else {
                if nums[mid] < nums[start] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return 0
    }
    
    func binarySearch(nums:[Int], start: Int, end: Int, target:Int) -> Int {
        var left = start, right = end
        while left <= right {
            let mid:Int = (left + right) / 2
            if nums[mid] != target {
                if nums[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                return mid
            }
        }
        return -1
    }
}
