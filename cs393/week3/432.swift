
class AllOne {
    var max: Node
    var min: Node
    var dict: [String:Node]

    init() {
        self.dict = [:]
        self.max = Node(key: "---HEAD", count: Int.max)
        self.min = Node(key: "---TAIL", count: Int.min)
        self.max.next = min
        self.min.prev = max
    }
    
    func inc(_ key: String) {
        if let node = dict[key] { // if it exists
            node.count += 1
            
            //rebalance
            while node.count > node.prev?.count ?? Int.max {
                var prevNode = node.prev!
                removeNode(node)
                node.prev = prevNode.prev
                node.next = prevNode
                prevNode.prev?.next = node
                prevNode.prev = node
            }

        } else { // key does not exists
            var n = Node(key: key, count: 1)
            dict[key] = n
        }

        //update position of node
        update(dict[key]!)

    }
    
    func dec(_ key: String) {
        var node = dict[key]!
        node.count -= 1
        if node.count == 0 {
            dict.removeValue(forKey: key)
            removeNode(node)
        } else {
            //rebalance
            while node.count < node.next?.count ?? Int.min {
                var nextNode = node.next!
                removeNode(node)
                node.prev = nextNode
                node.next = nextNode.next
                nextNode.next?.prev = node
                nextNode.next = node
            }

            update(node)
        }
    }
    


    func removeNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func update(_ node: Node) {
        if node.count >= max.next!.count {
            removeNode(node)
            insertAtMax(node)
        }
        if node.count <= min.prev!.count {
            removeNode(node)
            insertAtMin(node)
        }
    }

    func insertAtMax(_ node: Node) {
        node.prev = max
        node.next = max.next
        max.next = node
        node.next?.prev = node
    }

    func insertAtMin(_ node: Node) {
        node.prev = min.prev
        node.next = min
        min.prev = node
        node.prev?.next = node
    }
}

class Node {
    var key: String
    var count: Int
    var next: Node?
    var prev: Node?

    init(key: String, count: Int) {
        self.key = key
        self.count = count
    }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * let obj = AllOne()
 * obj.inc(key)
 * obj.dec(key)
 * let ret_3: String = obj.getMaxKey()
 * let ret_4: String = obj.getMinKey()
 */

// let allOne = AllOne();
// allOne.inc("a");
// allOne.inc("b");
// allOne.inc("c");
// allOne.inc("d");
// allOne.inc("a");
// allOne.inc("b");
// allOne.inc("c");
// allOne.inc("d");
// allOne.inc("c");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("a");
// var res = allOne.getMinKey()
// print(res)


// ["AllOne","inc"     ,"inc","inc","inc",      "inc","inc","inc",      "inc","inc","inc",      "dec","dec",    "getMaxKey"]
// [[],["hello"],      ["l"],["l"],["l"],        ["k"],["k"],["k"],      ["j"],["j"],["j"],      ["j"],["k"],    []]

let allOne = AllOne();
allOne.inc("hello");
allOne.inc("l");
allOne.inc("l");
allOne.inc("l");
allOne.inc("k");
allOne.inc("k");
allOne.inc("k");
allOne.inc("j");
allOne.inc("j");
allOne.inc("j");
allOne.dec("j");
allOne.dec("k");
var res = allOne.getMaxKey()
print(res == "l")