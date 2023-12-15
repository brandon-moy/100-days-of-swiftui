// var is a mutable variable
var name = "Brandon"

// let is an immutable variable
let lastName = "Moy"

// using the \" \" will allow Swift to know that this is a double quote
let quote = "Then he tapped a sign \"Believe\" and walked away."

// multiline strings - needs to have triple quotation marks wrapping the string
// the triple quotes MUST be on their own line
let movie ="""
A day in
the life of an
Apple engineer
"""

// the count method will return the length of the string - Swift will cound spaces and emojis
let nameLength = name.count

// the uppercased method will return the string fully capitalized
name.uppercased()

//  Why does .count not need the () while .uppercased does?
// short answer is Swift does not need () for data ready but does need it for performing actions

// has prefix checks if a string starts with the input - strings are case sensitive
print(movie.hasPrefix("A day"))

