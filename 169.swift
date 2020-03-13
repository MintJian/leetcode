class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dictionary:[Int : Int] = [ : ]
        for i in nums {
            dictionary.updateValue((dictionary[i] ?? 0) + 1, forKey: i)
        }
        var maxKey:Int = dictionary.first!.key
        for (i,j) in dictionary {
            if dictionary[maxKey]! < j {
                maxKey = i
            }
        }
        return maxKey
    }
}

