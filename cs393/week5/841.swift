class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = Set<Int>()

        var keys = Queue() //rooms to visit, keys I have
        for key in rooms[0] {
            keys.enqueue(key)
        }
        visited.insert(0)

        while !(keys.count == 0) {
            var room = keys.dequeue()!
            // print("vi/iting \(room)")
            visited.insert(room)
            for key in rooms[room] {
                if !visited.contains(key){
                    keys.enqueue(key)
                }
            }
        }

        return visited.count == rooms.count
    }

}

class Node {
    var val: Int
    var prev: Node?
    var next: Node?
    init(_ v: Int) {        val = v
    }
}

class Queue {
    var head = Node(Int.max)
    var tail = Node(Int.min)
    var count = 0

    init() {
        head.next = tail
        tail.prev = head
    }
    
    func enqueue(_ val: Int) {
        count += 1
        var n = Node(val)

        n.prev = head
        n.next = head.next
        head.next?.prev = n
        head.next = n
    }

    func dequeue() -> Int? {
        if count == 0 {
            return nil
        }
        var n = tail.prev!
        var res = n.val

        n.prev?.next = n.next
        n.next?.prev = n.prev

        count -= 1
        
        return res
    }
}

var a = [[1,3],[3,0,1],[2],[0]]
print(Solution().canVisitAllRooms(a))