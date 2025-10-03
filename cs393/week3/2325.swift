func decodeMessage(_ key: String, _ message: String) -> String {
    var alph = Array("abcdefghijklmnopqrstuvwxyz")
    var alphIndx = alph.startIndex

    var dic: [Character:Character] = [:]
    dic[" "] = " "

    for char in key where dic[char] == nil {
        dic[char] = alph[alphIndx]
        alphIndx += 1
    }

    var res: [Character] = []
    for char in message {
        res.append(dic[char, default: " "])
    }
    return String(res)
}



