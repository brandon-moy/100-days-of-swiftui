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