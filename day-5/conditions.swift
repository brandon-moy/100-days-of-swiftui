// IF statements are used for checking conditions

if someCondition {
    print("Do something")
}


// If we pout in a real condition and something to happen it would look something like this:
let score = 85

if score > 80 {
    print("Great job!")
}

// Multiple conditions that check different variables
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

// When comparing strings, it will check which string would come first when sorted alphabetically
let ourName = "Brandon Moy"
let friendName = "Anthony Urbina"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// Using if statement to assign anonymous to   the variable if no input or username was provided
// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// We can also check the length of the string to see if it is empty
if username.count == 0 {
    username = "Anonymous"
}

// EVEN BETTER - Swift has an isEmpty method that will return a boolean if the item has nothing inside - works on strings, arrays, dictionaries, and sets
if username.isEmpty {
    username = "Anonymous"
}

// Checking multiple conditions together? We can use ELSE or ELSE IF statements
let age = 16

if age >= 18 {
    print("You can vote in the next election.")
}

if age < 18 {
    print("Sorry, you're too young to vote.")
}

// Let's make this better with an else statement
let age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

// If we had 3 conditions to check, we could use else if
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// Conditions can also be nested but instead it would be better to use the && operator to check multiple conditions
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// Therei s also the || operator to check if either of two conditions is true, either one OR the other is true
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// and of course when checking boolean we can just use the variable directly instead of checking if the boolean is == true
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

// else if statements with enums! We can do the same thing where when the enum is assigned, we do not need to recall the enum again
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}