let pricesInUSD = ["Apple": 1.5, "Banana": 0.99, "Orange": 2.0]

let conversion = 0.92
let pricesInEUR = pricesInUSD.mapValues { $0 * conversion }

print(pricesInEUR)
