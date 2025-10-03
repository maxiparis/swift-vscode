func compress(_ chars: inout [Character]) -> Int {
    if chars.count == 1 { return 1 }
    var l = 0
    var currGroupSize = 1

    for (r, char) in chars.enumerated() {
        var nextChar = r == chars.endIndex-1 ? nil : chars[chars.index(after: r)]
        
        if char != nextChar { //this is the end of the group
            // make the string eg: a2, b12
            var compressed: [Character] = [char] //a
            if currGroupSize > 1 { compressed.append(contentsOf: String(currGroupSize)) }
            var length = compressed.count
            
            for i in compressed.indices {
                chars[l] = compressed[i]
                l = chars.index(after: l)
            }

            currGroupSize = 1
        } else {
            currGroupSize += 1
        }
    }
    

    return l
}


var a: [Character] = "aabbccc".map { $0 }
var res: [Character] = "a2b2c3".map { $0 }
var resInt = 6

print(compress(&a) == 6 && a == res)