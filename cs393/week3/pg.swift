class LRUCache {
    var capacity: Int
    var d: [Int:Node] = [:]
    var head = Node(key: Int.min, value: Int.min)
    var tail = Node(key: Int.max, value: Int.max)


    init(_ capacity: Int) {
        self.capacity = capacity
        self.head.next = tail
        self.tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = d[key] else { return -1} 

        remove(node)
        moveToHead(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = d[key] { // if key exists
            node.value = value
            remove(node)
            moveToHead(node)
            //move to head
        } else {
            //evict if capacity is up
            if d.count == capacity {
                let lru = tail.prev!
                d.removeValue(forKey: lru.key)
                remove(lru)
            }

            //insert at front
            let node = Node(key: key, value: value)
            d[key] = node
            moveToHead(node)
        }
    }

    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func moveToHead(_ node: Node) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
}

class Node {
    var key: Int
    var value: Int
    var next: Node?
    var prev: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}



/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

var lRUCache = LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4