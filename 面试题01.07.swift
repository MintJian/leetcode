class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        if matrix.count == 1 {
            return
        }
        for i in 0...matrix.count / 2 - 1{
            matrix.swapAt(i, matrix.count - 1 - i)
        }

        for i in 0...matrix.count - 1 {
            for j in 0...i {
                var data:Int = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = data
            }
        }

    }
}
