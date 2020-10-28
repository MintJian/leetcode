class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        if deck == [] || deck.count < 2{
            return false
        }
        var dictionary: [Int : Int] = [:]
        
        for i in deck {
            dictionary.updateValue((dictionary[i] ?? 0) + 1, forKey: i)
        }
        
        var lastValue: Int = dictionary.first!.value
        for i in dictionary {
            if i.value != lastValue {
                lastValue = gcd(i.value, lastValue)
                if lastValue != 1 {
                    continue
                }
                return false
            }
        }
        
        return true
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var i: Int = a
        var j: Int = b
        
        while j != 0 {
            let k: Int = i % j
            i = j
            j = k
        }
        
        return i
    }
}
