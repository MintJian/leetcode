class Solution {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        if seq == "" {
            return []
        }
        
        var depthList: [Int] = []
        
        var nowDepth: Int = 0
        var maxDepth: Int = 0
        
        for i in 0...seq.count - 1 {
            if seq[seq.index(seq.startIndex, offsetBy: i)] == "(" {
                nowDepth += 1
                maxDepth = max(nowDepth, maxDepth)
                depthList.append(nowDepth)
            } else {
                maxDepth = max(nowDepth, maxDepth)
                depthList.append(nowDepth)
                nowDepth -= 1
            }
            
        }
        
        let averageDepth: Int = maxDepth / 2 + 1
        
        var answer: [Int] = []
        
        for i in depthList {
            if i < averageDepth {
                answer.append(0)
            } else {
                answer.append(1)
            }
        }
        
        return answer
    }
}
