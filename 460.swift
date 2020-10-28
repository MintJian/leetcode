class LFUCache {
    var capacity: Int = 0
    var minFrequency: Int = 0
    var frequencyDictionary: [Int : [Data]] = [:]
    var existKeys: [Int : Data] = [:]
    
    struct Data : Hashable, Equatable {
        var key: Int = 0
        var value: Int = 0
        var frequency: Int = 0
        
        var hashValue : Int {
            get {
                return "\(key), \(value), \(frequency)".hashValue
            }
        }
        
        init(key: Int, value: Int, frequency: Int) {
            self.key = key
            self.value = value
            self.frequency = frequency
        }
        
        static func ==(_ a: Data, _ b: Data) -> Bool {
            return a.hashValue == b.hashValue
        }
    }
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if capacity == 0 || existKeys[key] == nil {
            return -1
        }
        
        let point: Data = existKeys[key]!
        let value:Int = point.value, frequency:Int = point.frequency
        
        if frequencyDictionary[frequency] != nil {
            let place = (frequencyDictionary[frequency]!.firstIndex(of: point))
            if place != nil {
                frequencyDictionary[frequency]!.remove(at: (place!))
            }
            
            if frequencyDictionary[frequency]!.isEmpty {
                frequencyDictionary.removeValue(forKey: frequency)
                if minFrequency == frequency {
                    minFrequency += 1
                }
            }
        }
        
        if frequencyDictionary[frequency + 1] == nil {
            frequencyDictionary.updateValue([], forKey: frequency + 1)
        }
        
        frequencyDictionary[frequency + 1]!.insert(Data.init(key: key, value: value, frequency: frequency + 1), at: frequencyDictionary[frequency + 1]!.startIndex)
        
        existKeys.updateValue(frequencyDictionary[frequency + 1]!.first!, forKey: key)
        
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {
            return
        }
        
        if existKeys[key] == nil {
            if existKeys.count == capacity {
                guard (frequencyDictionary[minFrequency] != nil) && !frequencyDictionary[minFrequency]!.isEmpty else {
                    print("Error: frequencyDictionary[minFrequency] == nil or == []")
                    return
                }
                
                let point: Data = frequencyDictionary[minFrequency]!.last!
                existKeys.removeValue(forKey: point.key)
                frequencyDictionary[minFrequency]!.popLast()
                
                if frequencyDictionary[minFrequency]!.isEmpty {
                    frequencyDictionary.removeValue(forKey: minFrequency)
                }
            }
            if frequencyDictionary[1] == nil {
                frequencyDictionary.updateValue([], forKey: 1)
            }
            
            frequencyDictionary[1]!.insert(Data.init(key: key, value: value, frequency: 1), at: frequencyDictionary[1]!.startIndex)
            
            existKeys.updateValue(frequencyDictionary[1]!.first!, forKey: key)
            minFrequency = 1
        } else {
            let point: Data = existKeys[key]!
            let frequency:Int = point.frequency
            
            if frequencyDictionary[frequency] != nil {
                let place = (frequencyDictionary[frequency]!.firstIndex(of: point))
                if place != nil {
                    frequencyDictionary[frequency]!.remove(at:(place!))
                }
                
                if frequencyDictionary[frequency]!.isEmpty {
                    frequencyDictionary.removeValue(forKey: frequency)
                    if minFrequency == frequency {
                        minFrequency += 1
                    }
                }
            }
            
            if frequencyDictionary[frequency + 1] == nil {
                frequencyDictionary.updateValue([], forKey: frequency + 1)
            }
            
            frequencyDictionary[frequency + 1]!.insert(Data.init(key: key, value: value, frequency: frequency + 1), at: frequencyDictionary[frequency + 1]!.startIndex)
            
            existKeys.updateValue(frequencyDictionary[frequency + 1]!.first!, forKey: key)
        }
    }
}
