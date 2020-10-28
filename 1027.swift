class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        if arr.isEmpty || arr.count == 1 { return true }
        var isUnique = true
        var dictionary: [Int : Int] = [:]
        var unique: Set<Int> = []
        
        for now in arr {
            let value = dictionary[now]
            if value != nil {
                dictionary[now]! += 1
            } else {
                dictionary.updateValue(1, forKey: now)
            }
        }
        
        for now in dictionary {
            let value = now.value
            if !unique.contains(value) {
                unique.insert(value)
            } else {
                isUnique = false
                break
            }
        }
        
        return isUnique
    }
}
