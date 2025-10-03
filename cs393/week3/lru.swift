
class LRUCache {
    var dict: [Int:Node] = [:] //node per key
    var capacity: Int
    var head = Node(key: Int.max, value: Int.max)
    var tail = Node(key: Int.min, value: Int.min)

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard let foundNode = dict[key] else { return -1 }

        remove(foundNode)
        moveToHead(foundNode)
        return foundNode.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            remove(node)
            moveToHead(node)
        } else { //key doesn't exists
            if dict.count == capacity {
                // remove lru
                let lastNode = tail.prev!
                dict.removeValue(forKey: lastNode.key)
                remove(lastNode)
            }

            //insert into dict
            let new = Node(key: key, value: value)
            dict[key] = new
            // move to front
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
var a = lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
var b = lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
var c = lRUCache.get(1);    // return -1 (not found)
var lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4