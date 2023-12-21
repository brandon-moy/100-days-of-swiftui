// Functions are reusable snippets of code with a name to be easily referred to.

// It starts with the func keyword, the name of the function, parenthesis for any parameters, and finally curly brackets for the function code block
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// for a real example, a function that prints multiples of a number
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// When calling the function, the arguments must be in the same order that the parameters were created in
// if instead printTimesTables had an additional paramter end. . .
func printTimesTables(number: Int, end: Int) {
    for i in 1...12 {
      print("\(i) x \(number) is \(i  * number)")
    }
}

// This is valid because we are passing number first and then end
printTimesTables(number: 5, end: 20)
// whereas this is NOT valid because end is being passed before number
printTimesTables(end: 20, number: 5)

// If we want a value BACK from the function, instead of printing the value we can use the return statement
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

// This has been for single item returns, what about multiple item returns?

// We could return it in an array. . .
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])") 

// but problems here are what is user[0] and what is user[1]?

// What about a dictionary?
func getUser() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user = getUser()
print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")
// Here we have meaninful names but we have to assign defaults

// A better solution is a tuple. 
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
// Tuples can have names (WITHOUT QUOTES) are are associated to the values

// Tuples are going to be diffferent from dictionaries because we use dot notation to access the tuple value instead of bracket notation
// Dictionaries may have hundreds of other values but tuples can't

// Customize function parameters
func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

// What about when parameter names are less than helpful?
let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

// When we call hasPrefix() we pass in the prefix to check for directly
//  – we don’t say hasPrefix(string:) or, worse, hasPrefix(prefix:). How come?

// Well, when we’re defining the parameters for a function we can actually add
//  two names: one for use where the function is called, and one for use inside
//   the function itself. hasPrefix() uses this to specify _ as the external 
//   name for its parameter, which is Swift’s way of saying “ignore this” and
//   causes there to be no external label for that parameter.

// Let's try it in our own function
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string: string)

// We can use the _ before the parametr name to remove the external parameter label
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

// We can also use something like for instead of _ to be the external parameter name
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// but let's use for instead

funct printTimesTables(for number: Int) {
  for i in 1...12 {
    print("\(i) x \(number) is \(i * number)")
  }
}

printTimesTables(for: 5)

// BUT we can take it a step futher and have an internal and external name

// this allows US to use number inside of the function
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

// but we use for as the external call name
printTimesTables(for: 5)