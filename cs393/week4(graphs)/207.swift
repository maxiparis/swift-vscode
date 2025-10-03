class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        //make adj list
        var seen: Set<Int> = []

        //key = prereq, value = where to go, so if (1, 0), 0 is key and 1 is value, since we go from 0 to 1
        var nodes : [Int:[Int]] = [:]

        for prereq in prerequisites {
            var from = prereq[1]
            var to = prereq[0]
            nodes[from, default: []].append(to)
        }

        var repeated = false

        for node in nodes.keys {
            traverse(node)
            if repeated { return false }
            seen = []
        }

        func traverse(_ node: Int) {
            var (inserted, _) = seen.insert(node)
            if !inserted { 
                repeated = true 
                return
            }

            nodes[node, default: []].forEach { traverse($0) }
            seen.remove(node)
            nodes[node] = []
        }
        
        return true
    }
}


var a = Solution()
var p = [[1,4],[2,4],[3,1],[3,2]]
var n = 5


print(a.canFinish(n, p)) // should be true