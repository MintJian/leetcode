class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        var numberOfIsland:Int = 0
        var safeArray = [[Character]](repeating: [Character](repeating: "0", count: grid[0].count + 2), count: grid.count + 2)
        
        discoverMap = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count + 2), count: grid.count + 2)
        
        for i in 0...grid.count - 1 {
            for j in 0...grid[0].count - 1 {
                safeArray[i + 1][j + 1] = grid[i][j]
            }
        }
        
        for i in 0...grid[0].count + 1 {
            discoverMap[0][i] = true
            discoverMap[grid.count + 1][i] = true
        }
        
        for i in 0...grid.count + 1 {
            discoverMap[i][0] = true
            discoverMap[i][grid[0].count + 1] = true
        }
        
        nowMap = discoverMap
        
        for i in 0...grid.count - 1 {
            for j in 0...grid[0].count - 1 {
                if grid[i][j] == "1" && discoverMap[i + 1][j + 1] == false {
                    discoverMap[i + 1][j + 1] = true
                    discover(beginX: i + 1, beginY: j + 1, in: safeArray)
                    numberOfIsland += 1
                }
            }
        }
        
        return numberOfIsland
    }
    
    var discoverMap:[[Bool]] = []
    var nowMap:[[Bool]] = []
    
    func discover(beginX:Int, beginY:Int, in array: [[Character]]) {
        nowMap[beginX][beginY] = true
        if discoverMap[beginX - 1][beginY] == false && array[beginX - 1][beginY] == "1" && nowMap[beginX - 1][beginY] == false {
            discover(beginX: beginX - 1, beginY: beginY, in: array)
        }
        if discoverMap[beginX][beginY - 1] == false && array[beginX][beginY - 1] == "1" && nowMap[beginX][beginY - 1] == false{
            discover(beginX: beginX, beginY: beginY - 1, in: array)
        }
        if discoverMap[beginX + 1][beginY] == false && array[beginX + 1][beginY] == "1" && nowMap[beginX + 1][beginY] == false{
            discover(beginX: beginX + 1, beginY: beginY, in: array)
        }
        if discoverMap[beginX][beginY + 1] == false && array[beginX][beginY + 1] == "1" && nowMap[beginX][beginY + 1] == false{
            discover(beginX: beginX, beginY: beginY + 1, in: array)
        }
        discoverMap[beginX][beginY] = true
    }
}
