//2020.5
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid.first!.isEmpty { return 0 }
        discoverMap = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
        gridArray = grid
        var maxSize = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid.first!.count {
                if grid[i][j] == 0 { continue }
                if discoverMap[i][j] == false {
                    maxSize = max(maxSize, discoverAt(x: i, y: j))
                }
            }
        }
        
        return maxSize
    }
    
    var discoverMap = [[Bool]]()
    var gridArray = [[Int]]()
    
    private func discoverAt(x:Int, y:Int) -> Int {
        discoverMap[x][y] = true
        if gridArray[x][y] == 0 { return 0 }
        
        var size = 0
        if gridArray[x][y] == 1 {
            size += 1
        }
        if x > 0 && discoverMap[x - 1][y] == false {
            size += discoverAt(x: x - 1, y: y)
        }
        if x < gridArray.count - 1 && discoverMap[x + 1][y] == false {
            size += discoverAt(x: x + 1, y: y)
        }
        if y > 0 && discoverMap[x][y - 1] == false {
            size += discoverAt(x: x, y: y - 1)
        }
        if y < gridArray.first!.count - 1 && discoverMap[x][y + 1] == false {
            size += discoverAt(x: x, y: y + 1)
        }
        
        return size
    }
}

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid == [] {
            return 0
        }
        table = grid
        var maxSize:Int = 0
        
        
        let yLine:[Bool] = [Bool](repeating: false, count: table[0].count)
        discoverMap = [[Bool]](repeating: yLine, count: table.count)
        
        if table[0].count > 0 {
            for i in 0...table.count - 1 {
                for j in 0...table[i].count - 1 {
                    if table[i][j] == 1 && discoverMap[i][j] == false {
                        maxSize = max(maxSize, discoverSize(x: i, y: j))
                    }
                }
            }
        }
        
        return maxSize
    }
    
    var table: [[Int]] = []
    var discoverMap: [[Bool]] = []
    
    func discoverSize(x: Int, y:Int) -> Int {
        discoverMap[x][y] = true
        if table[x][y] == 0 {
            return 0
        }
        var size:Int = 0
        
        size += 1
        
        if y + 1 < table[0].count && y + 1 >= 0{
            if discoverMap[x][y + 1] == false {
                size += discoverSize(x: x, y: y + 1)
            }
        }
        if y - 1 < table[0].count && y - 1 >= 0{
            if discoverMap[x][y - 1] == false {
                size += discoverSize(x: x, y: y - 1)
            }
        }
        if x + 1 < table.count && x + 1 >= 0 {
            if discoverMap[x + 1][y] == false {
                size += discoverSize(x: x + 1, y: y)
            }
        }
        if x - 1 < table.count && x - 1 >= 0 {
            if discoverMap[x - 1][y] == false {
                size += discoverSize(x: x - 1, y: y)
            }
        }
        return size
    }
}

