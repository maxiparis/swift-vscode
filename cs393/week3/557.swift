func reverseWords(_ s: String) -> String {
    var a = s.split(separator: " ")
    var revd = a.map { $0.reversed() } 
    return String(a.map { $0.reversed() } .joined(separator: " "))
}

var s = "Let's take LeetCode contest"
var r = "s'teL ekat edoCteeL tsetnoc"
print(reverseWords(s) == r ? "✅" : "❌")
