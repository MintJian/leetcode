class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        if board.count == 0 || board.first?.count ?? 0 == 0 {
            return
        }
        
        var nearLive: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count:( board.first?.count ?? -2) + 2), count: board.count + 2)
        
        for i in 1...board.count {
            for j in 1...board[i - 1].count {
                if board[i - 1][j - 1] == 1{
                    nearLive[i + 1][j] += 1
                    nearLive[i + 1][j + 1] += 1
                    nearLive[i + 1][j - 1] += 1
                    nearLive[i][j + 1] += 1
                    nearLive[i][j - 1] += 1
                    nearLive[i - 1][j + 1] += 1
                    nearLive[i - 1][j] += 1
                    nearLive[i - 1][j - 1] += 1
                }
            }
        }
        for i in 0...board.count - 1 {
            for j in 0...board[i].count - 1 {
                if board[i][j] == 1 {
                    if nearLive[i + 1][j + 1] < 2 || nearLive[i + 1][j + 1] > 3 {
                        board[i][j] = 0
                    }
                } else {
                    if nearLive[i + 1][j + 1] == 3 {
                        board[i][j] = 1
                    }
                }
            }
        }
    }
}
