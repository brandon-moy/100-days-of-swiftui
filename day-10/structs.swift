// Structs are custom, complex data dypes  with their own variables and functions

// this is an Album data type with two string constants and one integer constant
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

// We create a new Album as is calling a function
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    // these variables are called properteries
    let name: String
    var vacationRemaining: Int

    // the functions are called methods
    // functions that want to modify data must be marked specially by adding the mutating keyword
    mutating func takeVacation(days: Int) { 
        if vacationRemaining > days {
            // inside of the struct, the function is not allowed to change the structs variables unless it is a mutating function
            vacationRemaining -= days 
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// variables created with the struct are called instances and creating the instance is called the initializer
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// Computing property values dynamically
// computed properties calculate the value of the property dynamically every time it's accessed - they are a blend of both stored properteis and functions
// looking back at our last example. . .
struct Employee {
    let name: String
    var vacationRemaining: Int
}

// but we're losing how many days we initially allocated
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.vacationRemaining -= 5
print(archer.vacationRemaining)
archer.vacationRemaining -= 3
print(archer.vacationRemaining)

// we could adjust to use a computed property like so
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

// Now rather than making vacationRemaining something we can assign to directly, 
// it is instead calculated by subtracting how much vacation they have taken from how much vacation they were allotted.

// now vacationRemaining looks like a regular stored property
var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)

// but the issue is that we can't write to this though because we haven't told Swift how it should be handled
// we can provide a getter and a setter – fancy names for “code that reads” and “code that writes” respectively.

var vacationRemaining: Int {
    get {
        vacationAllocated - vacationTaken
    }

    set {
        vacationAllocated = vacationTaken + newValue
    }
}

// if we add this to our struct, we can then modify vacationRemaining
var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

// How to take action when a property changes

// Swift lets us create property observers, which are special pieces of code that run when properties change.
//  These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.

// Let's look at this example without observers
struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1
// but this makes 3 changes and only prints twice

// If we attach a property observer, whenever the score changes it will print the score
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// Swift also automaticaly provides the constants oldValue inside of didSet and newValue inside of willSet before the property changes
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// Initializers are specialized methods that are designed to prepare a new struct instance to be used.
// you can also create your own as long as you follow one golden rule: all properties must have a value by the time the initializer ends.
struct Player {
    let name: String
    let number: Int
}

// this the memberwise initializer, which is a fancy way of saying an initializer that accepts each property in the order it was defined.
let player = Player(name: "Megan R", number: 15)

// We could write our own but the catch is to be careful to distinguish between the names nad parameters coming in and the names of properties being assigned.
struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

// A few things to note
// 1. There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
// 2. Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
// 3. I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.

// Important: Although you can call other methods of your struct inside your initializer, you can’t do 
// so before assigning values to all your properties – Swift needs to be sure everything is safe before doing anything else.