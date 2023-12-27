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

// How can we shorten this syntax?

// We don't need to specity the parameter types ebcause they must be strings and the return must be a bool so we can rewrite to this

// let captainFirstTeam = team.sorted(by: { name1, name2 in

// we can also use  trailing closure syntax which Swift allows
let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// rather than passing the closure as a parameter, we just start the closure directly
// Swift can also automatically provide parameter names for us - this is called shorthand syntax
// instead of writing name1 or name2, we can use the special named values with $0 and $1

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
// this syntax isn't necessary everywhere and does make it less clear if values are being used more than once
// if this was a reverse sort and using the values once, then it would be easier to understand
let reverseTeam = team.sorted {
    return $0 > $1
}
// we can also remove the return line because this is a single line
let reverseTeam = team.sorted { $0 > $1 }

// There are no fixed rules about when to use shorthand syntax and when not to, but in case it’s helpful I use shorthand syntax unless any of the following are true:

// The closure’s code is long.
// $0 and friends are used more than once each.
// You get three or more parameters (e.g. $2, $3, etc).


// Functions to accept functions are parameters

// Previously we looked at this function
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()

// Here’s a function that generates an array of integers by repeating a function a certain number of times, lets break it down

// makeArray function, takes 2 parameters, one is a number of integers and also returns an array of integers
// the second parameter is a function. it accepts no parameters itself but will return one integer every time it's called
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
  // we create an empty array of integers
    var numbers = [Int]()
  // loop through as many times as requested
    for _ in 0..<size {
      // call the generator function that was passed as a paramter which returns a number
        let newNumber = generator()
      // add the number to the array
        numbers.append(newNumber)
    }
  // return the array of numbers
    return numbers
}

// You can accept multiple function parameters in which you can specify multiple trailing closures
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}