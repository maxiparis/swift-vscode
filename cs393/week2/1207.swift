func uniqueOccurrences(_ arr: [Int]) -> Bool {
    var occurrencesPerNumber = [Int:Int]()
    var occurrenceSeen = Set<Int>()
    for num in arr {
        occurrencesPerNumber[num, default: 0] += 1
    }
    
    for occurrence in occurrencesPerNumber.values {
        let insResult = occurrenceSeen.insert(occurrence)
        if !insResult.inserted { return false }
    }

    return true
}