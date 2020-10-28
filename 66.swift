class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var answer: [Int] = digits
        answer[answer.count - 1] += 1

        var isComplete = answer[answer.count - 1] < 10
        var now =  answer.count - 1
        while !isComplete {
            if (now != 0) {
                answer[now] -= 10
                answer[now - 1] += 1
                if answer[now - 1] < 10 {
                    isComplete = true
                } else {
                    now -= 1
                }
            } else {
                answer[now] -= 10
                answer.insert(1, at: 0)
                isComplete = true
            }
        }
        
        return answer
    }
}
