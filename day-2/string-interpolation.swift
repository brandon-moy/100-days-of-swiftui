// strings can be combined using the + operator
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

// in this case swift will combine strings one at a time
// 1 + 2 -> 12 + 3 -> 123 + 4 -> 1234 + 5
let luggageCode = "1" + "2" + "3" + "4" + "5"

// you can also inject variables containing strings into another string by using \(variableName)
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

// you can add strings to string, integers to integers but you cannot use + for a string and a number
let number = 11
let missionMessage = "Apollo " + number + " landed on the moon."

// IF you want to do this, you should convert the number to a string or use string interpolation
missionMessage = "Apollo " + String(number) + " landed on the moon."
//  or
missionMessage = "Apollo \(number) landed on the moon."

