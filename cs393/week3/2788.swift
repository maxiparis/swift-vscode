func splitWordsBySeparator(_ words: [String], _ separator: Character) -> [String] {
    var r: [String] = []
    for word in words { 
        var s = word.split(separator: separator)
        var str = s.map(String.init)
        r.append(contentsOf: str)
    }

    return r
    // return words.flatMap { $0.split(separator: separator).map(String.init) }
}

var words = ["one.two.three","four.five","six"]
var separator: Character = "."
var result = ["one","two","three","four","five","six"]

// print(splitWordsBySeparator(words, separator) == result)
print(words.flatMap({ $0.split(separator: separator) }))


// ----
// Things learned
// map(String.init)
// flatmap