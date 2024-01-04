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