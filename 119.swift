class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        if rowIndex == 1 {
            return [1,1]
        }

        var answer:[[Int]] = [[1], [1,1]]

        for i in 3...rowIndex + 1 {
            var thisLine:[Int] = [1]
            for j in 0...answer.last!.count - 2 {
                thisLine.append(answer[answer.count - 1][j] + answer[answer.count - 1][j + 1])
            }
            thisLine.append(1)
            answer.append(thisLine)
            answer.remove(at: answer.startIndex)
        }
        return answer.last!
    }
}

