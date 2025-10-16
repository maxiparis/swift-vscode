class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var res: [Bool] = Array(repeating: false, count: queries.count)
        var classesPerRequisite: [Int: Set<Int>] = [:]
        var visited = Set<Int>()

        // returns true if before is ancestor of after
        func traverse(_ prerequisite: Int) -> Set<Int> {
            if visited.contains(prerequisite) { 
                return classesPerRequisite[prerequisite, default: []]
            }
            
            var children = classesPerRequisite[prerequisite, default: []]

            visited.insert(prerequisite)
            var res = children
            for child in children {
                res.formUnion(traverse(child))
            }

            classesPerRequisite[prerequisite] = res
            return res
        }

        // build the original map
        for prereq in prerequisites {
            var before = prereq[0]
            var after = prereq[1]
            classesPerRequisite[before, default: []].insert(after)
        }


        for (index, query) in queries.enumerated() {
            var beforeQuery = query[0]
            var afterQuery = query[1]

            traverse(beforeQuery)

            res[index] = classesPerRequisite[beforeQuery]!.contains(afterQuery)
        }
        
        return res
    }
}

var a = [[0,1],[1,2],[2,4],[3,2],[5,3]]
var q = [[0,3],[1,4],[1,3],[2,3],[3,2],[5,4]]

print(Solution().checkIfPrerequisite(6, a, q))

// to improve:
// name varibles eg: var before = prereq[0]
// perfect how to deal with dictionaries, iterate, insert, get, etc
// read the problem first and try to understand it:
    // ask questions, draw
// understand set methods, like union or formUnion
// before using an array, ask myself, does order matter? 


