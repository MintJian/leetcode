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

/*
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        searchValue = target
        doSearch(array: nums, start: 0, end: nums.count - 1)
        return place
    }
    
    var searchValue = -1
    var place = -1
    
    func doSearch(array: [Int], start:Int, end: Int) {
        if start == end - 1 {
            if array[start] != searchValue && array[end] != searchValue {
                return
            } else {
                if array[start] == searchValue {
                    place = start
                    return
                } else {
                    place = end
                    return
                }
            }
        } else if start == end {
            if array[start] != searchValue {
                return
            } else {
                place = start
                return
            }
        }
        
        let mid = (start + end) / 2
        
        let startValue = array[start]
        let midValue = array[mid]
        
        if place > -1 {
            return
        }
        if midValue == searchValue {
            place = mid
            return
        } else if midValue > startValue {
            if midValue > searchValue {
                if startValue > searchValue {
                    doSearch(array: array, start: mid + 1, end: end)
                } else {
                    doSearch(array: array, start: start, end: mid)
                }
            } else {
                    doSearch(array: array, start: mid + 1, end: end)
            }
        } else {
            if midValue > searchValue {
                    doSearch(array: array, start: start, end: mid)
            } else {
                if startValue > searchValue {
                    doSearch(array: array, start: mid + 1, end: end)
                } else {
                    doSearch(array: array, start: start, end: mid)
                }
            }
        }
        
    }
}

*/
