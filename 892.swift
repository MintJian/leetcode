class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        if grid == [] {
            return 0
        }
        
        var space: [[[cube]]] = [[[cube]]].init(repeating: [[]], count: grid.count)
        var maxX:Int = space.count, maxY:Int = 0, maxZ:Int = 0
        
        for i in 0...grid.count - 1 {
            maxY = max(maxY, grid[i].count)
            space[i] = [[cube]].init(repeating: [], count: grid[i].count)
            for j in 0...grid[i].count - 1 {
                maxZ = max(maxZ, grid[i][j])
                space[i][j] = [cube].init(repeating: cube.init(isExist: true), count: grid[i][j])
            }
        }
        
        for i in 0...maxX - 1 {
            for j in 0...maxY - 1 {
                if maxZ > space[i][j].count {
                    space[i][j].append(contentsOf: [cube].init(repeating: cube.init(isExist: false), count: maxZ - space[i][j].count))
                }
            }
        }
        
        for i in 0...maxX - 1 {
            for j in 0...maxY - 1 {
                for k in 0...maxZ - 1 {
                    //check top
                    if k + 1 != maxZ {
                        if space[i][j][k + 1].exist {
                            space[i][j][k].top = false
                        }
                    }
                    //check buttom
                    if k != 0 {
                        if space[i][j][k - 1].exist {
                            space[i][j][k].buttom = false
                        }
                    }
                    //check back
                    if j != 0 {
                        if space[i][j - 1][k].exist {
                            space[i][j][k].back = false
                        }
                    }
                    //check front
                    if j + 1 != maxY {
                        if space[i][j + 1][k].exist {
                            space[i][j][k].front = false
                        }
                    }
                    //check left
                    if i != 0 {
                        if space[i - 1][j][k].exist {
                            space[i][j][k].left = false
                        }
                    }
                    //check top
                    if i + 1 != maxX {
                        if space[i + 1][j][k].exist {
                            space[i][j][k].right = false
                        }
                    }
                }
            }
        }
        
        var ans:Int = 0
        
        for i in 0...maxX - 1 {
            for j in 0...maxY - 1 {
                for k in 0...maxZ - 1 {
                    if space[i][j][k].exist {
                        if space[i][j][k].top {
                            ans += 1
                        }
                        if space[i][j][k].back {
                            ans += 1
                        }
                        if space[i][j][k].buttom {
                            ans += 1
                        }
                        if space[i][j][k].front {
                            ans += 1
                        }
                        if space[i][j][k].left {
                            ans += 1
                        }
                        if space[i][j][k].right {
                            ans += 1
                        }
                    }
                }
            }
        }
        return ans
    }
    
    
}

struct cube {
    var exist:Bool = false
    var top: Bool = false
    var buttom: Bool = false
    var left: Bool = false
    var right: Bool = false
    var front: Bool = false
    var back: Bool = false
    
    init(isExist: Bool) {
        if isExist {
            exist = true
            top = true
            buttom = true
            left = true
            right = true
            front = true
            back = true
        }
    }
}
