class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty && !matrix[0].isEmpty else { return 0 }
        var maxLength = 0
        var lengthSquare = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        lengthSquare[i][j] = 1
                    } else {
                        lengthSquare[i][j] = (min(lengthSquare[i - 1][j], lengthSquare[i][j - 1], lengthSquare[i - 1][j - 1])) + 1
                    }
                }
                maxLength = max(maxLength, lengthSquare[i][j])
            }
        }
        
        return maxLength * maxLength
    }
}

