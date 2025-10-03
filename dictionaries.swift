// MARK: Declaration of dictionaries

var a = [Int:Int]()
var b = [1: true, 10: false]
var c = Dictionary<Int, String>()


// MARK: Accessing values

var d = [
    "carl": true, 
    "john": false,
    "erik": true,
    "joanna": false
]

print(d["carl", default: false])

// MARK: Adding values

d["marina"] = false
print("before removing:\n-", d.keys)

// MARK: Removing values

d.removeValue(forKey: "marina")     // 1 or
d["erik"] = nil                     // 2

print("after removing 2 elements:\n-", d.keys, "\n")

// MARK: Iteration

for (name, adult) in d {
    print(name, adult ? "is an adult" : "is NOT an adult")
}

print("\nkeys:")
for key in d.keys {
    print("-", key)
}

print("\nvalues:")
for value in d.values {
    print("-", value)
}

// MARK: Most useful dictionary methods

let allAdults = d.allSatisfy { $0.value } // false

let prevCarl = d.updateValue(false, forKey: "carl")!

let dWithStrings = d.mapValues { $0 ? "Adult" : "Not adult" }