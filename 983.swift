class Solution {
    var costList: [Int] = []
    var travelDays: Set<Int> = []
    var calendar = [Int](repeating: -1, count: 366)
    
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        costList = costs
        for eachDay in days {
            travelDays.insert(eachDay)
        }
        return dp(day: 1)
    }
    
    func dp(day: Int) -> Int {
        if day > 365 {
            return 0
        }
        if calendar[day] != -1 {
            return calendar[day]
        }
        if travelDays.contains(day) {
            calendar[day] = min(dp(day: day + 1) + costList[0],dp(day: day + 7) + costList[1], dp(day: day + 30) + costList[2] )
        } else {
            calendar[day] = dp(day: day + 1)
        }
        return calendar[day]
    }
}
