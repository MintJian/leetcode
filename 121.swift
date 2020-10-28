class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices == [] || prices.count == 1{
            return 0
        }

        var result = 0
        var minValue = prices.max()!

        for i in 0...prices.count - 1 {
            if minValue > prices[i] {
                minValue = prices[i]
            } else {
                result = max(result, prices[i] - minValue)
            }
        }

        return result
    }
}

