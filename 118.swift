class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        if numRows == 1 {
            return [[1]]
        }

        if numRows == 2 {
            return [[1], [1,1]]
        }

        var answer:[[Int]] = [[1], [1,1]]

        for i in 3...numRows {
            var thisLine:[Int] = [1]
            for j in 0...answer[i - 2].count - 2 {
                thisLine.append(answer[i - 2][j] + answer[i - 2][j + 1])
            }
            thisLine.append(1)
            answer.append(thisLine)
        }

        return answer
    }
}
