class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var res = Array(repeating: false, count: queries.count)
        var coursesPerPrereq: [Int:Set<Int>] = [:]

        var visited: Set<Int> = []

        func canReach(from prereq: Int, to course: Int) -> Bool {
            var children = coursesPerPrereq[prereq, default: []]
            if children.contains(course) {
                return true
            }

            for child in children {
                if canReach(from: child, to: course) {
                    return true
                }
            }


            return false

        }

        // create original map
        for prereqArray in prerequisites {
            var prereq = prereqArray[0]
            var course = prereqArray[1]

            coursesPerPrereq[prereq, default: []].insert(course)
        }

        // check queries
        for i in 0..<queries.count {
            var prereq = queries[i][0]
            var course = queries[i][1]   

            res[i] = canReach(from: prereq, to: course)
        }

        return res
    }
}


var a = [[0,1],[1,2],[2,3],[3,4]]
var b = [[0,4],[4,0],[1,3],[3,0]]
print(Solution().checkIfPrerequisite(5, a, b))