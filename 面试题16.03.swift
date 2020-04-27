class Solution {
    func intersection(_ start1: [Int], _ end1: [Int], _ start2: [Int], _ end2: [Int]) -> [Double] {
         
        var small1:[Int] = []
        var small2:[Int] = []
        var big1:[Int] = []
        var big2:[Int] = []
         
        if start1[0] > end1[0] {
            small1 = end1
            big1 = start1
        } else {
            small1 = start1
            big1 = end1
        }
        if start2[0] > end2[0] {
            small2 = end2
            big2 = start2
        } else {
            small2 = start2
            big2 = end2
        }
         
        if small1[0] > small2[0] {
            swap(&amp;small1, &amp;small2)
            swap(&amp;big1, &amp;big2)
        }
         
        var k1:Double = 0
        var k2:Double = 0
         
 
        //small, big
        var tall1:[Int] = []
        var tall2:[Int] = []
         
        if small1[1] > big1[1] {
            tall1 = [big1[1], small1[1]]
        } else {
            tall1 = [small1[1], big1[1]]
        }
        if small2[1] > big2[1] {
            tall2 = [big2[1], small2[1]]
        } else {
            tall2 = [small2[1], big2[1]]
        }
         
        if Double(big1[0] - small1[0]) == 0 || Double(big2[0] - small2[0]) == 0 {
             
            if Double(big1[0] - small1[0]) == 0 &amp;&amp; Double(big2[0] - small2[0]) == 0 {
                if small1[0] != small2[0] {
                    return []
                } else {
                     
                    if tall1[0] <= tall2[0] {
                        if tall1[1] >= tall2[0] {
                            return [Double(big1[0]),Double(tall2[0])]
                        } else {
                            return []
                        }
                    } else {
                        if tall2[1] >= tall1[0] {
                            return [Double(big1[0]),Double(tall1[0])]
                        } else {
                            return []
                        }
                    }
                }
            } else {
                var validK:Double = 0
                var validB:Double = 0
                if Double(big1[0] - small1[0]) == 0 {
                    validK = Double(big2[1] - small2[1]) / Double(big2[0] - small2[0])
                    validB = Double(small2[1]) - validK * Double(small2[0])
                     
                    let targetX:Double = Double(big1[0])
                    let targetY:Double = f(x: targetX, k: validK, b: Double((validB)))
                     
                    if targetY >= Double(tall2[0]) &amp;&amp; targetY <= Double(tall2[1]) {
                        return [targetX, targetY]
                    } else {
                        return []
                    }
 
                } else {
                    validK = Double(big1[1] - small1[1]) / Double(big1[0] - small1[0])
                    validB = Double(small1[1]) - validK * Double(small1[0])
                     
                    let targetX:Double = Double(big2[0])
                    let targetY:Double = f(x: targetX, k: validK, b: Double((validB)))
                     
                    if targetY >= Double(tall1[0]) &amp;&amp; targetY <= Double(tall1[1]) {
                        return [targetX, targetY]
                    } else {
                        return []
                    }
                }
            }
        } else {
             
            k1 = Double(big1[1] - small1[1]) / Double(big1[0] - small1[0])
            k2 = Double(big2[1] - small2[1]) / Double(big2[0] - small2[0])
             
            let b1:Double = Double(small1[1]) - k1 * Double(small1[0])
            let b2:Double = Double(small2[1]) - k2 * Double(small2[0])
             
            if k1 == k2 &amp;&amp; b1 == b2 {
                if small2[0] <= big1[0] {
                    return [Double(small2[0]), Double(small2[1])]
                } else {
                    return []
                }
            } else if k1 == k2 &amp;&amp; b1 != b2 {
                if f(x: 1, k: k1, b: b1) == f(x: 1, k: k2, b: b2) {
                    return [Double(small2[0]), Double(small2[1])]
                } else {
                    return []
                }
            }
             
             
            let targetX:Double = -Double(b2 - b1) / Double(k2 - k1)
            let targetY:Double = f(x: targetX, k: k1, b: b1)
             
            if !(Double(small1[0]) <= targetX &amp;&amp; Double(big1[0]) >= targetX &amp;&amp; Double(small2[0]) <= targetX &amp;&amp; Double(big2[0]) >= targetX &amp;&amp; Double(tall1[0]) <= targetY &amp;&amp; Double(tall1[1]) >= targetY &amp;&amp; Double(tall2[0]) <= targetY &amp;&amp; Double(tall2[1]) >= targetY) {
                return []
            } else {
                return[targetX, targetY]
            }
        }
         
        return[-1, -1]
    }
     
    func f(x: Double,k:Double, b:Double) -> Double {
        return k * x + b
    }
}
