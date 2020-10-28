
class LRUCache {
    var head = linkedDicNode(-1, -1)
    var tail = linkedDicNode(-1, -1)
    class linkedDicNode {
        var key: Int = 0
        var value: Int = 0
        var privious: linkedDicNode? = nil
        var next: linkedDicNode? = nil
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    func removeNode(_ node: linkedDicNode) {
        let privious = node.privious
        let next = node.next
        
        privious!.next = next
        next!.privious = privious
    }
    
    func addNode(_ node: linkedDicNode) {
        node.privious = head
        node.next = head.next
        head.next!.privious = node
        head.next = node
    }
    
    func updateNode(_ node: linkedDicNode) {
        removeNode(node)
        addNode(node)
    }
    
    func popLast() -> linkedDicNode {
        let node = tail.privious
        removeNode(node!)
        return node!
    }
    
    var cache = [Int : linkedDicNode]()
    var capacity = -1
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        head.privious = nil
        tail.next = nil
        tail.privious = head
    }
    
    func get(_ key: Int) -> Int {
        let value = cache[key]
        if value == nil { return -1 }
        updateNode(value!)
        return value!.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity <= 0 { return }
        let node = cache[key]
        
        if node == nil {
            let newNode = linkedDicNode(key, value)
            if cache.count >= capacity {
                let poped = popLast().key
                cache.removeValue(forKey: poped)
            }
            addNode(newNode)
            cache.updateValue(newNode, forKey: key)
        } else {
            node!.value = value
            updateNode(node!)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
