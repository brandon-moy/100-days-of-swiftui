// This creates a function
func greetUser() {
    print("Hi there!")
}

greetUser()

// and this creates a copy of the function and assigns the copy to the greetCopy
var greetCopy = greetUser
greetCopy()

// This is creating a closure
// a chunk of code we can pass around and call whenever we want
let sayHello = {
    print("Hi there!")
}

sayHello()

// If we want the closure to accept parameters, they need to be written a certain way
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

// The in keyword comes right after the parameters and the return type of the closure
// in marks the end of the parameters and return type and everythign after is the body

// Every function’s type depends on the data it receives and sends back. 
// That might sound simple, but it hides an important catch: the names of the data it receives are not part of the function’s type.
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}
// while getUserData accepts int and returns string, when we copy the function it doesn't include the for external parameter use
// so we call it as data(1989) and not data(for: 1989)
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// Why does parameter name and showing or not matter?
// Lets take the sorted call
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// What is we wanted to control the sort?
// determines whether or not the first name is Suzanne and returns true or false OR if neither is Suzanna it sorts the two names
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// but lets do this with a closure instead
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
