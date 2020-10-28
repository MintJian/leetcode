class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 {
            return []
        }
        let list:[Int] = arr.sorted()
        return list[0...k - 1].sorted()
    }
}
