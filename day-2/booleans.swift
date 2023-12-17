let filename = "paris.jpg"
// returns a boolean to print
print(filename.hasSuffix(".jpg"))

let number = 120
// returns a boolean to print
print(number.isMultiple(of: 3))

// initializing a variable to be a boolean by assigning it with true or false
let goodDogs = true
let gameOver = false

// initializing a boolean and switching it to the opposite boolean value
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

// the toggle method will also flip a value to the opposite boolean value
gameOver.toggle()
print(gameOver)