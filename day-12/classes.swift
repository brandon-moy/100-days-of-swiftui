// there is another way to create custom data types other than structs called classes.

// Some similarities are:
// You get to create and name them.
// You can add properties and methods, including property observers and access control.
// You can create custom initializers to configure new instances however you want.

// But the differences are:
// You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// Even if you make a class constant, you can still change its properties as long as they are variables.

// The importance of classes is point 3: all copies of a class share the same data. This means many parts of your app can share the same information, 
// so that if the user changed their name in one screen all the other screens would automatically update to reflect that change.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// In this example of a class, it looks just like as truct with the difference using the class name instead of struct

// Swift lets us create classes by basing them on existing classes, which is a process known as inheritance.
// To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name

// For example, lets look at the first class Employee
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
    print("I work \(hours) hours a day.")
}
}

// and we can use this to have other SUBCLASSES called Developer and Manager which inherit properties from the Employee class
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }

    override func printSummary() {
    print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
}
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

// we can also hare properties and methods such as the printSummary() that is added to employee and now we can use it on our employee
let novall = Developer(hours: 8)
novall.printSummary()

// what is we want a child class to have a method with a slightly different behavior?

// We can use the override keyword which does 2 things:
// If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
// If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.

// Class initializers in Swift are more complicated than struct initializers
// if a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.

// let's look at a new class
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
// and let's say we want a Car class inheriting from Vehicle
class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
    }
}
// BUT this has issues because the Vehicle class needs to know whether it's electric or not, in order to fix this we need to ask the super class to run the initializer
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
// now that we have valid initializers we can make an instance like so:
let teslaX = Car(isElectric: true, isConvertible: false)

// In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. 
// This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

// view this simple class for example:
class User {
    var username = "Anonymous"
}

var user1 = User()
// now we could take a copy of user1 and change the username value
var user2 = user1
user2.username = "Taylor"
// but this way, it prints Taylor for both
print(user1.username)  
print(user2.username)

// if we were to change this to a struct from a class, we would print Anoymous and then Taylor because it won't adjust the original.

// we can also create a unique copy of a class instance, a deep copy
class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

// This way, we could call copy() to get an object with the same starting data, but any future changes won't impact the original


// Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer 
// in that it gets called when the object is destroyed rather than when it’s created.

// this comes with a few small provisos:
// Just like initializers, you don’t use func with deinitializers – they are special.
// Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
// Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
// We never call deinitializers directly; they are handled automatically by the system.
// Structs don’t have deinitializers, because you can’t copy them.

// When deinitializers are called depends on scope - the context where information is available
// If you create a variable inside a function, you can’t access it from outside the function.
// If you create a variable inside an if condition, that variable is not available outside the condition.
// If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.

// Here is a class that prints a message when it's created and destroyed
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}
// one example to create and destroy instances using a loop - if we create User instance inside the loop, it will be destroyed when the loop iteration finishes:
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}


// Remember, the deinitializer is only called when the last remaining reference to a class instance is destroyed. 
// This might be a variable or constant you have stashed away, or perhaps you stored something in an array.

// For example, if we were adding our User instances as they were created, they would only be destroyed when the array is cleared:
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")