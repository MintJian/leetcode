class Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        let mPlaceInArray = m - 1

        var array:[Int] = []
        
        for i in 0...n-1 {
            array.append(i)
        }

        var nowPlace = 0
        
        while array.count > 1 {
            nowPlace += mPlaceInArray
            if nowPlace > array.count - 1 {
                nowPlace = nowPlace % array.count
            }
            array.remove(at: nowPlace)
        }
        
        return array.first!
    }
}
