class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.isEmpty || nums.count == 1 {
            return nums
        }
        
        return mergeSort(array: nums, left: 0, right: nums.count - 1)
    }

    func mergeSort(array: [Int], left: Int, right: Int) -> [Int]{
        if left == right {
            return [array[left]]
        }
        if left == right - 1 {
            return array[left] < array[right] ? [array[left], array[right]] : [array[right], array[left]]
        }
        let mid: Int = (left + right) / 2
        
        var leftArray: [Int] = mergeSort(array: array, left: left, right: mid)
        var rightArray: [Int] = mergeSort(array: array, left: mid + 1, right: right)
        
        var sortedArray: [Int] = []
        
        while !leftArray.isEmpty && !rightArray.isEmpty {
            sortedArray.append(leftArray.first! < rightArray.first! ? leftArray.removeFirst() : rightArray.removeFirst())
        }
        
        if !leftArray.isEmpty {
            sortedArray.append(contentsOf: leftArray[0...leftArray.count - 1])
        }
        
        if !rightArray.isEmpty {
            sortedArray.append(contentsOf: rightArray[0...rightArray.count - 1])
        }
        
        return sortedArray
    }
}
