/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */


class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let arrayCount = mountainArr.length()
        targetValue = target
        
        var start:Int = 0, end:Int = arrayCount - 1
        var midPoint:Int = -1
        
        while midPoint < 0 {
            let mid = (start + end) / 2
            let midValue = dictionary[mid] ?? mountainArr.get(mid)
            dictionary.updateValue(midValue, forKey: mid)
            
            var leftValue = 0
            if mid != 0 {
                leftValue = dictionary[mid - 1] ?? mountainArr.get(mid - 1)
                dictionary.updateValue(leftValue, forKey: mid - 1)
            } else {
                leftValue = midValue
            }
            
            var rightValue = 0
            if mid != arrayCount - 1 {
                rightValue = dictionary[mid + 1] ?? mountainArr.get(mid + 1)
                dictionary.updateValue(rightValue, forKey: mid + 1)
            } else {
                rightValue = midValue
            }
            
            if leftValue <= midValue && rightValue <= midValue {
                midPoint = mid
            } else {
                if leftValue < midValue && rightValue > midValue {
                    start = mid
                } else {
                    end = mid
                }
            }
        }
        
        var answer = binarySearch(array: mountainArr, start: 0, end: midPoint)
        if answer == -1 {
            flag = true
            answer = binarySearch(array: mountainArr, start: midPoint + 1, end: arrayCount - 1)
        }
        
        return answer
    }
    
    var targetValue: Int = -1
    var dictionary: [Int : Int] = [:]
    var flag = false
    
    func binarySearch(array: MountainArray, start: Int, end: Int) -> Int {
        var left = start, right = end
        
        while left <= right {
            let mid = (left + right) / 2
            let midValue = dictionary[mid] ?? array.get(mid)
            
            if midValue == targetValue {
                return mid
            } else {
                if flag {
                    if midValue > targetValue {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                } else {
                    if midValue > targetValue {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
            }
        }
        return -1
    }
}
