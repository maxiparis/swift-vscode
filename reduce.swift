func addAllNumbers(_ numbers: [Int]) -> Int {
    let a = numbers.reduce(0, +)
    return a
}

print(addAllNumbers((0...100).map { $0 }))