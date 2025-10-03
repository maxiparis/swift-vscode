func isPalindrome(_ s: String) -> Bool {
    var filteredS = Array<Character>()

    for char in s {
        if (char.isNumber || char.isLetter) {
            // filteredS.append(char.isLetter ? Character(char.lowercased()) : char)
            filteredS.append(Character(char.lowercased()))
        }
    }

    return filteredS == filteredS.reversed()
}

func isPalindrome2(_ s: String) -> Bool {
    let filteredS = Array(s.lowercased().filter { $0.isNumber || $0.isLetter })
    return filteredS == filteredS.reversed()
}


print(isPalindrome("panama") == false ? "✅" : "❌")
print(isPalindrome("A man, a plan, a canal: Panama") == true ? "✅" : "❌")