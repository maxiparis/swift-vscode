class LRUCache {
    var dict: [Int:Node] = [:]// ndoe per key
    var cap: Int
    var head: Node = Node(key: Int.max, value: Int.max)
    var tail: Node = Node(key: Int.min, value: Int.min)

    init(_ capacity: Int) {
        self.cap = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let found = dict[key] {
            remove(found)
            moveToHead(found)
            return found.value
        }

        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let foundNode = dict[key] {
            foundNode.value = value
            //remove
            //move to front
            remove(foundNode)
            moveToHead(foundNode)
        } else {
            if dict.count == cap {
                //evict lru
                let lru = tail.prev!
                dict.removeValue(forKey: lru.key)
                remove(lru)
            }

            let new = Node(key: key, value: value)
            dict[key] = new
            moveToHead(new)
        }
    }

    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func moveToHead(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next = node
        node.next?.prev = node
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