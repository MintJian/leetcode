
class MinStack {
    /** initialize your data structure here. */
    var minList = [Int]()
    var stack = [Int]()
    
    init() {
    }
    
    func push(_ x: Int) {
        if x <= minList.last ?? Int.max {
            minList.append(x)
        }
        stack.append(x)
    }
    
    func pop() {
        let nowTop = top()
        if nowTop == minList.last! {
            minList.popLast()!
        }
        stack.popLast()!
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minList.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
