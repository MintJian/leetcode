class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        var distanceMatrix = [[Int]](repeating: [Int](repeating: 10000, count: matrix[0].count), count: matrix.count)
        
        for i in 0...matrix.count - 1 {
            for j in 0...matrix[0].count - 1{
                if matrix[i][j] == 0 {
                    distanceMatrix[i][j] = 0
                }
                if i != 0 {
                    distanceMatrix[i][j] = min(distanceMatrix[i][j], distanceMatrix[i - 1][j] + 1)
                }
                if j != 0 {
                    distanceMatrix[i][j] = min(distanceMatrix[i][j], distanceMatrix[i][j - 1] + 1)
                }
            }
        }
        
        for i in stride(from: matrix.count - 1, to: -1, by: -1) {
            for j in stride(from: matrix[0].count - 1, to: -1, by: -1){
                if i != matrix.count - 1 {
                    distanceMatrix[i][j] = min(distanceMatrix[i][j], distanceMatrix[i + 1][j] + 1)
                }
                if j != matrix[0].count - 1 {
                    distanceMatrix[i][j] = min(distanceMatrix[i][j], distanceMatrix[i][j + 1] + 1)
                }
            }
        }
        
        return distanceMatrix
    }
}
