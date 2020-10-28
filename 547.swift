class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        if M.isEmpty { return 0 }
        var amount = 0
        discoveredRow = [Bool](repeating: false, count: M.count)
        
        for i in 0..<M.count {
            if discoveredRow[i] == false {
                doDiscover(M, line: i)
                amount += 1
            }
        }
        return amount
    }
    
    private var discoveredRow: [Bool] = []
    
    func doDiscover(_ array: [[Int]], line: Int) {
        for i in 0..<array.count {
            if array[line][i] == 1 && discoveredRow[i] == false {
                discoveredRow[i] = true
                doDiscover(array, line: i)
            }
        }
    }
}
