// Swift uses type inference to figure out what type of data constant or variable holds
let surname = "Lasso" // infers a string
var score = 0 // infers an integer

// by assigning the type, it allows us to be explicit about the data type we want
let surname: String = "Lasso"
var score: Int = 0

// We can also tell Swift we want the 0 to be a Double instead of an integer and it overrides Swift's type inference of an Integer to a Double
var score: Double = 0

// What about for arrays?
var albums: [String] = ["Red", "Fearless"]

// Dictionaries?
var user: [String: String] = ["id": "@twostraws"]

// WHat about sets?
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

