// sometimes – only sometimes – you want to add a property or method to the struct itself, 
// rather than to one particular instance of the struct, which allows you to use them directly.

// Let's look at this example of creating and using static properties and methods:
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// the static keyword means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct
School.add(student: "Taylor Swift")
print(School.studentCount)

// If you want to mix and match static and non-static properties and methods, there are two rules:

// 1. To access non-static code from static code… you’re out of luck: 
// static properties and methods can’t refer to non-static properties and methods because 
// it just doesn’t make sense – which instance of School would you be referring to?

// 2. To access static code from non-static code, always use your type’s name such as School.studentCount. 
// You can also use Self to refer to the current type. The capital S Self is different than lowercase s self

// self - current value of a struct  e.g. 55, "Hello", true
// Self - current type of a struct   e.g. Int, String, Bool

// static properties are useful for organizing common data in app, for example a struct like AppData
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

// This is useful for checking or displaying app's version number - an about screen, debug output, logging information, etc. . .
// it also helps to create examples of structs SwiftUI works best when it can show previews of your app as you develop
// This is best done using a static example property on the struct liks so:
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// Now, whenever you need an Employee instance, you can use Employee.example and be done!

