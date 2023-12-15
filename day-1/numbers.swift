let score = 10

// Swift ignores the _ but it can help people view and comprehend large numbers
let reallyBig = 100_000_000

// Normally using arithmetic operators
let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

// You can also do arithmetic + = operators to reassign the value back to the initial variable
var counter = 10
counter += 5
counter *= 2
counter -= 10
counter /= 2

// Decimal Numbers

// Floating point numbers view this as a double (double precision floating point number)
let number = 0.1 + 0.2
// this prints 0.3000000000000004...
print(number)

let a = 1
let b = 2.0
let c = a + b // Swift will not allow us to mix "int" type and "double" type - Swift type safety!

// Option A: treat a as a double
c = Double(a) + b

// Option B: treat b as an int
c = a + Int(b)

var rating = 5.0
rating += 2