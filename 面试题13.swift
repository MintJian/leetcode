class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if k == 0 {
            return 1
        }
        var distance : [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: n + 2), count: m + 2)
        distance[1][1] = 0
        
        for i in 1...m {
            for j in 1...n{
                let arrayI = (String(i - 1).reversed())
                let arrayJ = (String(j - 1).reversed())
                var number: Int = 0
                var size: Int = 1
                for i in arrayI {
                    number += Int(String(i))! * size
                }
                size = 1
                for i in arrayJ {
                    number += Int(String(i))! * size
                }
                if (number > k) {
                    continue
                }
                distance[i][j] = i - 2 + j
            }
            if distance[i][1] == -1 {
                break
            }
        }
        
        return search(distance: &distance, i: 1, j: 1)
    }
    
    func search(distance: inout [[Int]], i:Int, j:Int) -> Int {
        var amount: Int = 1
        distance[i][j] = -1
        if distance[i - 1][j] != -1 {
            amount += search(distance: &distance, i: i - 1, j: j)
        }
        if distance[i + 1][j] != -1 {
            amount += search(distance: &distance, i: i + 1, j: j)
        }
        if distance[i][j - 1] != -1 {
            amount += search(distance: &distance, i: i, j: j - 1)
        }
        if distance[i][j + 1] != -1 {
            amount += search(distance: &distance, i: i, j: j + 1)
        }
        return amount
    }
}
