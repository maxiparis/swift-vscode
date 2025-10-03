class LRUCache {
    var dict: [Int:Node] = [:]
    var capacity = Int.min
    var dummyHead: Node
    var dummyTail: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        dummyHead  = Node(key: Int.min, value: Int.min)
        dummyTail = Node(key: Int.max, value: Int.max)

        dummyHead.next = dummyTail
        dummyTail.previous = dummyHead
    }
    
    func get(_ key: Int) -> Int {
        let found = dict[key]
        guard found != nil else { return -1 }

        remove(node: found!)
        insertAfterHead(node: found!)

        return found!.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingNode = dict[key] {
            // Key already exists - update value and move to front
            existingNode.value = value
            remove(node: existingNode)
            insertAfterHead(node: existingNode)
        } else {
            // New key
            if dict.count >= capacity {
                // Remove least recently used (tail)
                if let lru = removeTail() {
                    dict.removeValue(forKey: lru.key)
                }
            }
            
            let newNode = Node(key: key, value: value)
            dict[key] = newNode
            insertAfterHead(node: newNode)
        }
    }

    func remove(node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
    }

    func insertAfterHead(node: Node) {
        node.next = dummyHead.next
        node.previous = dummyHead
        dummyHead.next?.previous = node
        dummyHead.next = node
    }
    
    func removeTail() -> Node? {
        let lru = dummyTail.previous
        if lru === dummyHead {
            return nil // Empty list
        }
        remove(node: lru!)
        return lru
    }
}


class Node {
    var next: Node?
    var previous: Node?
    var key: Int
    var value: Int

    init(key: Int, value: Int, next: Node? = nil, previous: Node? = nil) {
        self.key = key
        self.value = value
        self.next = next
        self.previous = previous
    }
}



let lru = LRUCache(2)
lru.put(1, 1)
lru.put(2, 2)
print(lru.get(1))    // returns 1
lru.put(3, 3)        // evicts key 2
print(lru.get(2))    // returns -1 (not found)
lru.put(4, 4)        // evicts key 1
print(lru.get(1))    // returns -1 (not found)
print(lru.get(3))    // returns 3
print(lru.get(4))    // returns 4
