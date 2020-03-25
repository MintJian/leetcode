class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var xOfRook: Int = -1
        var yOfRook: Int = -1
        var isRookBlack: Bool = false
        var isRookFound:Bool = false
        for i in 0...7 {
            for j in 0...7 {
                if board[i][j] == Character("R") {
                    xOfRook = i
                    yOfRook = j
                    isRookBlack = false
                    isRookFound = true
                    break
                }
                if board[i][j] == Character("r") {
                    xOfRook = i
                    yOfRook = j
                    isRookBlack = true
                    isRookFound = true
                    break
                }
            }
            if isRookFound {
                break
            }
            if i == 7 {
                return 0
            }
        }
        
        var target:Int = 0
        
        //up
        var nowX:Int = xOfRook
        var nowY:Int = yOfRook
        while nowY > 0 {
            nowY -= 1
            if board[nowX][nowY] != "." {
                if isRookBlack && board[nowX][nowY] == "P" {
                    target += 1
                }
                if !isRookBlack && board[nowX][nowY] == "p" {
                    target += 1
                }
                break
            }
        }
        
        //down
        nowX = xOfRook
        nowY = yOfRook
        while nowY < 7 {
            nowY += 1
            if board[nowX][nowY] != "." {
                if isRookBlack && board[nowX][nowY] == "P" {
                    target += 1
                }
                if !isRookBlack && board[nowX][nowY] == "p" {
                    target += 1
                }
                break
            }
        }
        
        //left
        nowX = xOfRook
        nowY = yOfRook
        while nowX > 0 {
            nowX -= 1
            if board[nowX][nowY] != "." {
                if isRookBlack && board[nowX][nowY] == "P" {
                    target += 1
                }
                if !isRookBlack && board[nowX][nowY] == "p" {
                    target += 1
                }
                break
            }
        }
        
        //left
        nowX = xOfRook
        nowY = yOfRook
        while nowX < 7 {
            nowX += 1
            if board[nowX][nowY] != "." {
                if isRookBlack && board[nowX][nowY] == "P" {
                    target += 1
                }
                if !isRookBlack && board[nowX][nowY] == "p" {
                    target += 1
                }
                break
            }
        }
        
        return target
    }
}
