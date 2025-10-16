class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var res = Array(repeating: false, count: queries.count)
        var coursesPerPrereq: [Int:Set<Int>] = [:]

        var visited: Set<Int> = []

        func traverse(_ prereq: Int) -> Set<Int> {
            if visited.contains(prereq) {
                return coursesPerPrereq[prereq, default: []]
            }

            visited.insert(prereq)

            var children = coursesPerPrereq[prereq, default: []]

            for course in children {
                children.formUnion(traverse(course))
            }

            coursesPerPrereq[prereq] = children
            return children
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

            traverse(prereq)

            res[i] = coursesPerPrereq[prereq, default: []].contains(course)
        }

        return res
    }
}


var a = [[0,1],[1,2],[2,3],[3,4]]
var b = [[0,4],[4,0],[1,3],[3,0]]
print(Solution().checkIfPrerequisite(5, a, b))