
class LRUCache {
    var dict: [Int:Node] = [:]
    var head: Node = Node(key: Int.max, value: Int.max) //always insert at head in head.next
    var tail: Node = Node(key: Int.min, value: Int.min) //do i need tail.prev??
    var capactity: Int

    init(_ capacity: Int) {
        self.capactity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if dict[key] != nil {
            var node = dict[key]!
            remove(node: node)
            insertAtHead(node: node)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if dict[key] != nil {
            //update value
            dict[key]?.value = value
            //put in front
            remove(node: dict[key]!)
            insertAtHead(node: dict[key]!)
        } else { //does not exists
            if dict.count == capactity {
                //evict lru key
                var node = tail.prev!
                dict.removeValue(forKey: node.key)
                node.prev?.next = tail
                tail.prev = node.prev
                // head - 1 - 2 - tail
            }
            //we are good with capacity
            dict[key] = Node(key: key, value: value)
            insertAtHead(node: dict[key]!)
        }
    }

    func remove(node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func insertAtHead(node: Node) {
        var t = head.next!
        head.next = node
        node.next = t
        node.prev = head
        t.prev = node
    }
}

class Node {
    var next: Node?
    var prev: Node?
    var value: Int
    var key: Int
    
    init(key: Int, value: Int) {
        self.value = value
        self.key = key
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
// lRUCache.get(2);    // returns -1 (not found)
// lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
// lRUCache.get(1);    // return -1 (not found)
// lRUCache.get(3);    // return 3
// lRUCache.get(4);    // return 4