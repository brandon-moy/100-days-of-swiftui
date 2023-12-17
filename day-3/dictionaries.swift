// Issues with storing data in an array

var employee = ["Taylor Swift", "Singer", "Nashville"]

// how do we know that these indices exist? How do we know they are input correctly in that order?
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

// Instead we can use a dictionary where we assign keys for the values to exist in
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer", 
    "location": "Nashville"
]

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

// If you try that in a playground, you’ll see Xcode throws up various warnings
//  along the lines of “Expression implicitly coerced from 'String?' to 'Any’”. 
// Worse, if you look at the output from your playground you’ll see it prints 
// Optional("Taylor Swift") rather than just Taylor Swift

// This means that the data may or may not be there so the solution is to provide a default value if it doesn't exist
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// Creating an empty dictionary and then adding items to it
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

// You can also overwrite a value by reusing the key
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin"