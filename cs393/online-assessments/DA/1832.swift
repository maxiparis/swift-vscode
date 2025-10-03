func checkIfPangram(_ sentence: String) -> Bool {
    var all = "thequickbrownfoxjumpsoverthelazydog"
    var s:[Character:Int] = [:]
    all.forEach { s[$0] = 0 }

    for char in sentence {
        s[char]! += 1
    }

    return s.values.allSatisfy { $0 > 0 }
}


var a = "thequickbrownfoxjumpsoverthelazydog"

print(checkIfPangram(a) == res)