class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        var answer = 0, status = 0
        var position = [Int](repeating: -1, count: 1 << 5)
        var arrayOfS = Array(s)
        position[0] = 0
        for i in 0..<arrayOfS.count {
            switch arrayOfS[i] {
                case "a":
                    status ^= 1 << 0
                case "e":
                    status ^= 1 << 1
                case "i":
                    status ^= 1 << 2
                case "o":
                    status ^= 1 << 3
                case "u":
                    status ^= 1 << 4
                default:
                    break
            }
            if position[status] >= 0 {
                answer = max(answer, i + 1 - position[status])
            } else {
                position[status] = i + 1
            }
        }
        return answer
    }
}
