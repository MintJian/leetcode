class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        }
        var nowString: [String.Element] = []
        var allStrings: [String] = ["()"]
        var dictionary: [String : Bool] = ["()" : true]
        
        while allStrings.last!.count != n * 2 {
            var newStrings: [String] = []
            for i in 0...allStrings.count - 1 {
                let template: [String.Element] = Array(allStrings[i])
                nowString = template
                for j in 0...allStrings[i].count - 2 {
                    if nowString[j] != nowString[j + 1] {
                        nowString = template
                        nowString.insert(contentsOf: ["(",")"], at: j)
                        var add:String = String(nowString)
                        if dictionary[add] == nil {
                            newStrings.append(add)
                            dictionary.updateValue(true, forKey: add)
                        }
                        nowString = template
                        nowString.insert(contentsOf: ["(",")"], at: j + 1)
                        add = String(nowString)
                        if dictionary[add] == nil {
                            newStrings.append(add)
                            dictionary.updateValue(true, forKey: add)
                        }
                    }
                }
            }
            if newStrings.first!.count == n * 2 {
                return newStrings
            }
            allStrings = newStrings
        }
        
        return []
    }
}
