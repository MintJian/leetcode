class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        if numCourses <= 0 { return [] }
        classNeed = [[Int]](repeating: [Int](), count: numCourses)
        visited = [Int](repeating: 0, count: numCourses)
        result = [Int]()

        for i in prerequisites {
            classNeed[i[1]].append(i[0])
        }
        for i in 0..<numCourses {
            if isValid && visited[i] == 0 {
                doSearch(i)
            }
            if !isValid {
                return []
            }
        }

        if !isValid {
            return []
        }

        return Array(result.reversed())
    }

    private var classNeed = [[Int]]()
    private var visited = [Int]()
    private var result = [Int]()
    private var isValid = true

    private func doSearch(_ val: Int) {
        visited[val] = 1
        for i in classNeed[val] {
            if visited[i] == 0 {
                doSearch(i)
                if !isValid {
                    return
                }
            } else if visited[i] == 1 {
                isValid = false
                return
            }
        }
        visited[val] = 2
        result.append(val)
    }
}
