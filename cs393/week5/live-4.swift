class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var res = Array(repeating: false, count: queries.count)
        var coursesPerPrereq: [Int:Set<Int>] = [:]

        var visited = Set<Int>()

        func traverse(_ prereq: Int) -> Set<Int>{
            if visited.contains(prereq) {
                return coursesPerPrereq[prereq, default: []]
            }

            visited.insert(prereq)
            
            var children = coursesPerPrereq[prereq, default: []]

            for child in children {
                children.formUnion(traverse(child))
            }

            coursesPerPrereq[prereq] = children
            return children

        }

        //fill adj list
        for prereqArray in prerequisites {
            var prereq = prereqArray[0]
            var course = prereqArray[1]

            coursesPerPrereq[prereq, default: []].insert(course)
        }


        // answer queries
        for (i, queryArray) in queries.enumerated() {
            var prereq = queryArray[0]
            var course = queryArray[1]

            traverse(prereq)

            res[i] = coursesPerPrereq[prereq, default: []].contains(course)
        }

        return res
    }
}