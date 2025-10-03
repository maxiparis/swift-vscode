func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    var repeatedChars = [Character : Int]()

    for i in s.indices {
        let schar = s[i]
        repeatedChars[schar, default: 0] += 1

        let tchar = t[i]
        repeatedChars[tchar, default: 0] -= 1
    }

    return repeatedChars.values.allSatisfy { $0 == 0}
}

print(isAnagram("String", "String") == true ? "✅" : "❌")
print(isAnagram("String", "Sting") == false ? "✅" : "❌")
print(isAnagram("anagram", "nagaram") == true ? "✅" : "❌")
print(isAnagram("rat", "car") == false ? "✅" : "❌")

// func printChars(_ chars1: String, _ chars2: String) {
//     for i in chars1.indices {
//         print(chars1[i], ",", chars2[i], "i:", i)
//     }
// }

// printChars("hello", "jamaica")