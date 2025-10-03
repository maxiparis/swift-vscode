func mergeAlternately(_ word1: String, _ word2: String) -> String {

    let count = max(word1.count, word2.count)
    var res = ""

    for i in 0..<count {
        if i < word1.count {
            let idx = word1.index(word1.startIndex, offsetBy: i)
            res += String(word1[idx])
        }

        if i < word2.count {
            let idx = word2.index(word2.startIndex, offsetBy: i)
            res += String(word2[idx])
        }
    }
    return res
}

var a = "absss"
var b = "er"
print(mergeAlternately(a, b))