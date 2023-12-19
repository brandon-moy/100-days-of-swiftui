// Ternaries are another way to check conditions

// It takes a condition, and then has a return if the condition is true, and a return if the condition is false

let age = 18
// WTF. It stands for “what, true, false”,
              //  What     True    False
let canVote = age >= 18 ? "Yes" : "No"

// Try to be aware of clarity, when using == it can be harder to read the statement
enum Theme {
    case light, dark
}

let theme = Theme.dark

// the condition is IF theme == .dark
let background = theme == .dark ? "black" : "white"
print(background)