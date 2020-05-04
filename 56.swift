//2020.5
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count < 2 { return intervals }
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var merged = [sortedIntervals[0]]
        
        for i in 1..<sortedIntervals.count {
            let nowArray = sortedIntervals[i]
            let priviousArray = merged[merged.count - 1]
            if priviousArray[1] >= nowArray[0] {
                if priviousArray[1] < nowArray[1]{
                    merged[merged.count - 1][1] = nowArray[1]
                } else {
                    continue
                }
            } else {
                merged.append(nowArray)
            }
        }
        
        return merged
    }
}


class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty || intervals.count == 1 {
            return intervals
        }
        //原来题目允许直接用sort，晕，还以为要自己写
        let sortedArray:[[Int]] = intervals.sorted {$0[0] < $1[0]}
        var answer:[[Int]] = [sortedArray.first!]
        var left:Int = answer.last![0]
        var right:Int = answer.last![1]
        
        for i in sortedArray {
            if i[0] >= left && i[0] <= right {
                if i[1] > right {
                    answer[answer.count - 1][1] = i[1]
                    left = i[0]
                    right = i[1]
                }
            } else {
                answer.append(i)
                left = i[0]
                right = i[1]
            }
        }
        return answer
    }
}
