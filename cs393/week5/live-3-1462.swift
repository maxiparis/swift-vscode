class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var res = Array(repeating: false, count: queries.count)
        var classPerPrerequisite: [Int:Set<Int>] = [:]

        for i in 0..<prerequisites.count {
            var prereq = prerequisites[i][0]
            var course = prerequisites[i][1]

            classPerPrerequisite[prereq, default: []].insert(course)
        }

        var visited: Set<Int> = []

        func canReach(_ before: Int) -> Set<Int> {
            if !visited.contains(before) {
                //union to my set all the courses my children can reach
                visited.insert(before)
                var courses = classPerPrerequisite[before, default: []]
                
                for course in courses {
                    courses.formUnion(canReach(course))
                }

                classPerPrerequisite[before, default: []] = courses
                return courses
            } else {
                return classPerPrerequisite[before, default: []]
            }
        }

        for i in 0..<queries.count { //(0, 1)
            var prereq = queries[i][0]
            var course = queries[i][1]

            canReach(prereq)
            
            res[i] = classPerPrerequisite[prereq, default: []].contains(course)
        }

        return res
    }
}