class Solution {
    func romanToInt(_ s: String) -> Int {
        var numberList:[Int] = []
        var answer: Int = 0
        var privious: Int = 0
        for i in s {
            numberList.append(getNumber(romanNumeral: i))
            if numberList.last == 0 {
                return -1
            }
        }
        
        while numberList.count > 0 {
            if numberList.last! >= privious {
                answer += numberList.last!
            } else {
                answer -= numberList.last!
            }
            privious = numberList.popLast()!
            
        }
        
        return answer
    }
    
    func getNumber(romanNumeral: Character) -> Int {
        var number = 0
        switch romanNumeral {
        case "I": number = 1;
        break;
        case "V": number = 5;
        break;
        case "X": number = 10;
        break;
        case "L": number = 50;
        break;
        case "C": number = 100;
        break;
        case "D": number = 500;
        break;
        case "M": number = 1000;
        break;
        default:
            number = 0
        }
        
        return number
    }
}
