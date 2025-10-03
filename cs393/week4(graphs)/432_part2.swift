class AllOne {
    var max = Node(frequency: Int.max)
    var min = Node(frequency: Int.min)
    var nodesPerKey: [String:Node] = [:]

    init() {
        max.next = min
        min.prev = max
    }
    
    func inc(_ key: String) {
        let node = nodesPerKey[key] ?? min
        // let newFrequency = Swift.max(node.frequency, 0) + 1
        let newFrequency = (node.frequency == min.frequency ? 0 : node.frequency) + 1
        let prevNode = node.prev

        if let prevNode, prevNode.frequency == newFrequency { 
            prevNode.keys.insert(key)
            nodesPerKey[key] = prevNode
        } else { // no node exists with that frequency
            //create a new node and insert before node (since we are increasing by 1)
            var newNode = Node(frequency: newFrequency, inserting: key)
            nodesPerKey[key] = newNode
            insert(node: newNode, before: node)
        }

        node.keys.remove(key)


        if node.keys.isEmpty && node.frequency != Int.min { 
            detach(node) 
        }
    }

    func dec(_ key: String) {
        guard nodesPerKey[key] != nil else { return }
        let node = nodesPerKey[key] ?? max
        // let newFrequency = Swift.min(node.frequency, 1) - 1
        let newFrequency = (node.frequency == max.frequency ? 1 : node.frequency) - 1
        let nextNode = node.next

        if newFrequency > 0 { // we only deal with this if we still want a node
            if let nextNode, nextNode.frequency == newFrequency { 
                nextNode.keys.insert(key)
                nodesPerKey[key] = nextNode
            } else { // no node exists with that frequency
                //create a new node and insert before node (since we are increasing by 1)
                var newNode = Node(frequency: newFrequency, inserting: key)
                nodesPerKey[key] = newNode
                insert(node: newNode, after: node)
            }
        } else {
            nodesPerKey.removeValue(forKey: key)
        }

        node.keys.remove(key)
        if node.keys.isEmpty && node.frequency != Int.max { 
            detach(node) 
        }
    }
    
    func getMaxKey() -> String {
        if nodesPerKey.isEmpty { return "" }
        
        return max.next!.keys.randomElement() ?? ""
    }
    
    func getMinKey() -> String {
        if nodesPerKey.isEmpty { return "" }
        
        return min.prev!.keys.randomElement() ?? ""
    }

    func insert(node: Node, before: Node) {
        node.next = before
        node.prev = before.prev

        before.prev?.next = node
        before.prev = node
    }

    func insert(node: Node, after: Node) {
        node.next = after.next
        node.prev = after

        after.next?.prev = node
        after.next = node
    }

    func detach(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
}
class Node {
    var next: Node?
    var prev: Node?
    var frequency: Int
    var keys: Set<String>

    init(frequency: Int = 0, inserting: String? = nil) {
        self.keys = []
        self.frequency = frequency

        if inserting != nil { keys.insert(inserting!)}
    }
}

var allOne = AllOne()
// alOne.inc("hello");
// allOne.inc("hello");
// var a = allOne.getMaxKey(); // return "hello"
// var b = allOne.getMinKey(); // return "hello"
// allOne.inc("leet");
// var c = allOne.getMaxKey(); // return "hello"
// var d = allOne.getMinKey(); // return "leet"


// "inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","getMinKey"]
// ["a"],["b"],["c"],["d"],["a"],["b"],["c"],["d"],["c"],["d"],["d"],["a"],[]]
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
// print(allOne.getMinKey() == "b")


// ["AllOne","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","inc","getMaxKey","getMinKey","inc","dec","getMaxKey","getMinKey"]

// [[],["a"],["b"],["b"],["b"],["c"],["c"],["c"],["c"],["c"],["c"],["d"],["d"],["d"],["d"],["d"],["d"],["d"],["d"],[],[],["b"],["d"],[],[]]
// allOne.inc("a");

// allOne.inc("b");
// allOne.inc("b");
// allOne.inc("b");

// allOne.inc("c");
// allOne.inc("c");
// allOne.inc("c");
// allOne.inc("c");
// allOne.inc("c");
// allOne.inc("c");

// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// allOne.inc("d");
// print(allOne.getMaxKey() == "d")
// print(allOne.getMinKey() == "a")
// allOne.inc("b");
// allOne.dec("d");
// print(allOne.getMaxKey() == "d")
// print(allOne.getMinKey() == "a")

allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")
allOne.inc("a")

allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")
allOne.inc("b")
allOne.dec("b")

print(allOne.getMaxKey())
print(allOne.getMinKey())