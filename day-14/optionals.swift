// Swift likes to be predictable, which means as much as possible it encourages us to write code that is safe 
// and will work the way we expect. You’ve already met throwing functions, but Swift has another important way of ensuring predictability 
// called optionals – a word meaning “this thing might have a value or might not.”

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

// SO this creates a [String: String] dictionary with two keys and attempt to read the key "Peach" which doesn't exist
// Swift's solution is called optionals, which means data that might be present or might not - which is represented by placing a questionmark after the data type

// So, a String? means there might be a string waiting inside for us, or there might be nothing at all – a special value called nil, 
// that means “no value”. Any kind of data can be optional, including Int, Double, and Bool, as well as instances of enums, structs, and classes.

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together, it does three things:
// - It reads the optional value from the dictionary.
// - If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
// - The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// unwrapping optionals with guard

// You’ve already seen how Swift uses if let to unwrap optionals, and it’s the most common way of using optionals. 
// But there is a second way that does much the same thing, and it’s almost as common: guard let.

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

// Like if let, guard let checks whether there is a value inside an optional, and if there is it will retrieve the value and place it into a constant of our choosing.

// However, the way it does so flips things around:

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}

// if let runs the code inside its braces if the optional had a value, and guard let runs the code inside its braces if the optional didn’t have a value.

// guard provides is the ability to check whether our program state is what we expect, and if it isn’t to bail out - sometimes called an early return
// we check that all a function’s inputs are valid right as the function starts, and if any aren’t valid we get to run some code then exit straight away. 
// If all our checks pass, our function can run exactly as intended.

// guard is designed exactly for this style of programming, and in fact does two things to help:

// If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
// If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

// So: use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.

// nil coalescing is the THIRD way of unwrapping optionals - it unwraps the optional but if it is empty it provides a default value instead
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"]

// trying to ready Serenity will mean new will be an optional string set to nil
// the nil coalescing operator, written ??, can provide a default value for any optional:
let new = captains["Serenity"] ?? "N/A"

// That will read the value from the captains dictionary and attempt to unwrap it. 
// If the optional has a value inside it will be sent back and stored in new, but if it doesn’t then “N/A” will be used instead.

// The end result is that new will be a real string and not an optional one

// we could have written it like this, but why do we have the nil coalescing operator?
let new = captains["Serenity", default: "N/A"]

// the nil coalescing operator not only works with dictionaries, but it works with any optionals.

// For example, the randomElement() method on arrays returns one random item from the array, 
// but it returns an optional because you might be calling it on an empty array. So, we can use nil coalescing to provide a default:
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

// Or perhaps you have a struct with an optional property, and want to provide a sensible default for when it’s missing:
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

// Optional chaining is a simplified syntax for reading optionals inside optionals. 

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// That uses two optional features at once: you’ve already seen how the nil coalescing operator helps provide a default value 
// if an optional is empty, but before that you see optional chaining where we have a question mark followed by more code.

// Optional chaining is saying "if the optional has a value inside, unwrap it then..."   and we can add more code

// You can optionally chain as long as you want but as soon as we hit nil, the rest of the code is ignored and sends back nil

// To give you an example that pushes optional chaining harder, imagine this: we want to place books in 
// alphabetical order based on their author names. If we break this right down, then:

// - We have an optional instance of a Book struct – we might have a book to sort, or we might not.
// - The book might have an author, or might be anonymous.
// - If it does have an author string present, it might be an empty string or have text, so we can’t always rely on the first letter being there.
// - If the first letter is there, make sure it’s uppercase so that authors with lowercase names such as bell hooks are sorted correctly.

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

// it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.

// When we call a function that might throw errors, we either call it using try and handle errors appropriately, or if we’re certain the function will not fail we 
// use try! and accept that if we were wrong our code will crash. (Spoiler: you should use try! very rarely.)

// However, there is an alternative: if all we care about is whether the function succeeded or failed, we can use an optional try to have the function return an optional value.
// This runs the function and if there are no errors, then the optional will contain the return values - but if any error was thrown the function will return nil
// BUT WE WILL NOT KNOW WHAT THE ERROR THROWN IS - it only tells us if the function worked or not

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// The getUser() function will always throw a networkFailed error, which is fine for our testing purposes, but we don’t actually care what error was thrown
//  – all we care about is whether the call sent back a user or not.

// This is where try? helps: it makes getUser() return an optional string, which will be nil if any errors are thrown.
// If you want, you can combine try? with nil coalescing, which means “attempt to get the return value from this function, but if it fails use this default value instead.”

// Be careful, though: you need to add some parentheses before nil coalescing so that Swift understands exactly what you mean. For example, you’d write this:
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// You’ll find try? is mainly used in three places:

// - In combination with guard let to exit the current function if the try? call returns nil.
// - In combination with nil coalescing to attempt something or provide a default value on failure.
// - When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.