class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func removeElements(_ head: ListNode?, _ target: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head

    var tail: ListNode? = dummy

    while tail != nil {
        if tail!.next?.val == target {
            tail!.next = tail!.next?.next
        }
        
        tail = tail!.next
    }

    return dummy.next
}

// Create 5 nodes
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

// Connect the nodes
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

// Now node1 is the head of the linked list
var head: ListNode? = node1

// Function to print the linked list
func printList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current!.val, terminator: " -> ")
        current = current!.next
    }
    print("nil")
}

// Print the linked list
printList(removeElements(head, 1))