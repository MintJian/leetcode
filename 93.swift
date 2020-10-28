class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count > 12 || s.count < 4 { return [] }
        var possible: [String] = []
        var test = [ArraySlice<String.Element>]()
        for i in 1..<s.count - 2 {
            var point1Str = Array(s)
            point1Str.insert(".", at: i)
            test = point1Str.split(separator: ".")
            if Int(String(test[0]))! > 255 || Int(String(test[0]))! < 0 { continue }
            if test[0].first! == "0" && test[0].count != 1 { continue }
            for j in i + 2..<point1Str.count {
                var point2Str = point1Str
                point2Str.insert(".", at: j)
                test = point2Str.split(separator: ".")
                if Int(String(test[1]))! > 255 || Int(String(test[1]))! < 0 { continue }
                if test[1].first! == "0" && test[1].count != 1 { continue }
                for k in j + 2..<point2Str.count {
                    var point3Str = point2Str
                    point3Str.insert(".", at: k)
                    test = point3Str.split(separator: ".")
                    if Int(String(test[2]))! > 255 || Int(String(test[2]))! < 0 { continue }
                    if test[2].first! == "0" && test[2].count != 1 { continue }
                    if Int(String(test[3]))! > 255 || Int(String(test[3]))! < 0 { continue }
                    if test[3].first! == "0" && test[3].count != 1 { continue }
                    
                    possible.append(String(point3Str))
                }
            }
        }
        return possible
    }
}
