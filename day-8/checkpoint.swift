// Write a function that accepts an integer from 10 through 10,000 and returns the integer square root ofthat number

enum numberError: Error {
    case outOfBounds, noRoot
}

func checkSquareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw numberError.outOfBounds
    }

    for i in 1...100 {
        if number == i * i {
            return i
        }
    }

    throw numberError.noRoot
}

let input = 100

do {
    let result = try checkSquareRoot(input)
    print("Square root of \(input) is \(result).")
} catch numberError.outOfBounds {
    print("\(input) is out of bounds")
} catch numberError.noRoot {
    print("\(input) is not a perfect square root.")
} catch {
    print("Error.")
}