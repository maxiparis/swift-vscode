let a = "hello"

// For-In Loop
for char in a {
    print(char)
}

// For-In Loop with Indices
for i in a.indices {
    print(a[i])
}

// Enumerated
for (index, char) in a.enumerated() {
    print("Index: \(index), Character: \(char)")
}

// Using forEach
a.forEach { char in
    print(char)
}

// While Loop with Index
var curr = a.startIndex
while curr < a.endIndex {
    print(a[curr])
    curr = a.index(after: curr)
}