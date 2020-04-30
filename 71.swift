class Solution {
    func simplifyPath(_ path: String) -> String {
        var valid = path.split(separator: "/").filter({$0 != "."})
        let validFileOrDir = valid.filter({$0 != ".."})
        if validFileOrDir.isEmpty { return "/" }
        let validLast = validFileOrDir.last!
        var nowLevel = 0
        var dictionary: [Int : [String]] = [:]
        var finalPath = ""
        
        for i in valid {
            switch i {
            case "..":
                nowLevel -= 1
            default:
                if nowLevel < 0 {
                    nowLevel = 0
                }
                var nowLVStrs:[String] = dictionary[nowLevel] ?? [String]()
                nowLVStrs.append(String(i))
                dictionary.updateValue(nowLVStrs, forKey: nowLevel)
                if i != validLast {
                    nowLevel += 1
                }
            }
        }
        
        if dictionary.isEmpty || nowLevel < 0 { return "/" }
        
        while nowLevel != -1 {
            let nowElement = valid.popLast()!
            if dictionary[nowLevel]!.contains(String(nowElement)) {
                finalPath = nowElement + "/" + finalPath
                nowLevel -= 1
            }
        }
        
        finalPath.removeLast()
        
        return "/" + finalPath
    }
}
