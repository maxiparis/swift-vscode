import Foundation

// PRACTICE EXERCISES - Try to solve each one!
// Start simple, build up complexity

print("=== EXERCISE 1: Basic .init ===")
print("Convert these numbers to strings: [1, 2, 3, 4, 5]")
let numbers1 = [1, 2, 3, 4, 5]
// YOUR CODE HERE:
let result1 = numbers1.map(String.init)
// Expected output: ["1", "2", "3", "4", "5"]

print("\n=== EXERCISE 2: Basic compactMap ===")
print("Convert these strings to integers (remove invalid ones): [\"1\", \"hello\", \"3\", \"world\", \"5\"]")
let strings2 = ["1", "hello", "3", "world", "5"]
// YOUR CODE HERE:
let result2 = strings2.compactMap(Int.init)
// Expected output: [1, 3, 5]

print("\n=== EXERCISE 3: Basic flatMap ===")
print("Split these sentences into individual words: [\"hello world\", \"swift rocks\"]")
let sentences3 = ["hello world", "swift rocks"]
// YOUR CODE HERE:
let result3 = sentences3.flatMap { $0.split(separator: " ").map( String.init) }
// Expected output: ["hello", "world", "swift", "rocks"]

print("\n=== EXERCISE 4: flatMap with .init ===")
print("Split by comma and convert Substrings to Strings: [\"a,b,c\", \"d,e\"]")
let csvData4 = ["a,b,c", "d,e"]
// YOUR CODE HERE:
let result4 = csvData4.flatMap { $0.split(separator: ",").map(String.init) }
// Expected output: ["a", "b", "c", "d", "e"]

print("\n=== EXERCISE 5: compactMap with Double ===")
print("Convert to doubles, keep only valid ones: [\"1.5\", \"invalid\", \"3.14\", \"not_a_number\"]")
let mixedStrings5 = ["1.5", "invalid", "3.14", "not_a_number"]
// YOUR CODE HERE:
// let result5 = 
// Expected output: [1.5, 3.14]

print("\n=== EXERCISE 6: flatMap creating arrays ===")
print("For each number, create array [number, number*2], then flatten: [1, 2, 3]")
let numbers6 = [1, 2, 3]
// YOUR CODE HERE:
let result6 = numbers6.map { [$0, $0*2] }.flatMap { $0 }
// Expected output: [1, 2, 2, 4, 3, 6]

print("\n=== EXERCISE 7: Chain compactMap and map ===")
print("Convert valid strings to Int, then back to String: [\"1\", \"hello\", \"2\", \"world\", \"3\"]")
let mixed7 = ["1", "hello", "2", "world", "3"]
// YOUR CODE HERE:
let result7 = mixed7.compactMap(Int.init).map(String.init)
// Expected output: ["1", "2", "3"]

print("\n=== EXERCISE 8: flatMap with semicolons ===")
print("Split by semicolon: [\"x;y;z\", \"a;b\", \"single\"]")
let semiData8 = ["x;y;z", "a;b", "single"]
// YOUR CODE HERE:
// let result8 = 
// Expected output: ["x", "y", "z", "a", "b", "single"]

print("\n=== EXERCISE 9: compactMap with custom logic ===")
print("Convert to Int, but only keep even numbers: [\"1\", \"2\", \"3\", \"4\", \"invalid\", \"6\"]")
let numbersToFilter9 = ["1", "2", "3", "4", "invalid", "6"]
// YOUR CODE HERE:
let result9 = numbersToFilter9.compactMap { n in 
    if let c = Int(n) {
        return c % 2 == 0 ? c : nil
    } else {
        return nil
    }
}
// Expected output: [2, 4, 6]

print("\n=== EXERCISE 10: Combine all three! ===")
print("Split by pipes, convert to Int, keep only positive: [\"1|2|-3\", \"4|invalid|5\", \"-1|0|7\"]")
let complex10 = ["1|2|-3", "4|invalid|5", "-1|0|7"] 
// YOUR CODE HERE:
// let result10 = 
// Expected output: [1, 2, 4, 5, 7]

// HINTS:
print("\n=== HINTS ===")
print("💡 Remember:")
print("   • map(Type.init) - when conversion always works")
print("   • compactMap(Type.init) - when conversion might fail (removes nils)")
print("   • flatMap { ... } - when you need to flatten arrays")
print("   • You can chain them: .flatMap(...).compactMap(...).map(...)")

// BONUS CHALLENGE:
print("\n=== BONUS CHALLENGE ===")
print("Create a function that takes [String] and Character, returns [Int]")
print("Split by separator, convert valid numbers to Int")
print("func extractNumbers(_ words: [String], separator: Character) -> [Int] {")
print("    // YOUR CODE HERE")
print("}")
print("Test: extractNumbers([\"1,2,hello\", \"3,invalid,4\"], \",\")")
print("Expected: [1, 2, 3, 4]")