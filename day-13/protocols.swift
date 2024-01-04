// Protocols are a bit like contracts in Swift: they let us define what kinds of 
// functionality we expect a data type to support, and Swift ensures that the 
// rest of our code follows those rules.

// For example, we might write code to simulate commuting from home to office
func commute(distance: Int, using vehicle: Car) {
    // lots of code here
}

// or they may commut through other means

func commute(distance: Int, using vehicle: Train) {
    // lots of code here
}

func commute(distance: Int, using vehicle: Bus) {
    // lots of code here
}

// in this case we don't care about HOW the trip happens but we care about the action of moving

// This is where protocols come in: they let us define a series of properties and methods that 
// we want to use. They don’t implement those properties and methods – they don’t actually 
// put any code behind it – they just say that the properties and methods must exist, a bit like a blueprint.

// To create a new protocol we write protocol followed by the protocol name. This is a new type, so we need to use camel case starting with an uppercase letter.
protocol Vehicle {
  // Inside the protocol we list all the methods we require in order for this protocol to work the way we expect.
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// These methods do not contain any code inside – there are no function bodies provided here. Instead, we’re 
// specifying the method names, parameters, and return types. You can also mark methods as being throwing or mutating if needed.

// Now we can make a Car struct that conforms to Vehicle:

// We tell Swift that Car conforms to Vehicle by using a colon after the name Car, just like how we mark subclasses.
struct Car: Vehicle {

  // All the methods we listed in Vehicle must exist exactly in Car.
  // The methods in Car provide actual implementations of the methods we defined in the protocol.
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

  // openSunroof doesn't come from the Vehicle protocol, but it's okay because protocols define the minimum functionality conforming types
    func openSunroof() {
        print("It's a nice day!")
    }
}

// If we update the commute() function from earlier so it uses the methods we  get something like this:
func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// but the protocol isn't adding any value - so we can actually use Vehicle as the type of our parameter instead of car
func commute(distance: Int, using vehicle: Vehicle) {
// the code here
}

// Second example:
struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)


// we can now either pass a Car or a Bicycle into the commute() function. Internally the function can have 
// all the logic it wants, and when it calls estimateTime() or travel() Swift will automatically use the 
// appropriate one – if we pass in a car it will say “I’m driving”, but if we pass in a bike it will say “I’m cycling”.

// protocols let us talk about the kind of functionality we want to work with, rather than the exact types.

// As well as methods, you can also write protocols to describe properties that must exist on conforming types. 
// To do this, write var, then a property name, then list whether it should be readable and/or writeable.

// For example, we could specify that all types that conform Vehicle must specify how many seats they have and how many passengers they currently have, like this:
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// This adds two properties
// A string called name, which must be readable. That might mean it’s a constant, but it might also be a computed property with a getter.
// An integer called currentPassengers, which must be read-write. That might mean it’s a variable, but it might also be a computed property with a getter and setter.

// Swift provides one really obscure, really complex, but really important feature called opaque return types, which let us remove complexity in our code.

// returns a random number between 1 and 6
func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

// returns either true of false
func getRandomBool() -> Bool {
    Bool.random()
}

// Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” 
// The Equatable protocol is what allows us to use ==, like this:
print(getRandomNumber() == getRandomNumber())

// Because both of these types conform to Equatable, we could try amending our function to return an Equatable value, like this:
func getRandomNumber() -> Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> Equatable {
    Bool.random()
}

// put this will throw the error "protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements"
// which means returning Equatable does not make sense

// opaque return types let us hide information in our code, but not from the Swift compiler
// this allows us to make our code flexible internally so we can return different things in the future, but Swift always understands the actual data type being returned
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// From our perspective we still only have some Equatable data but Swift knows that they are actually two integers

// Returning an opaque return type means we still get to focus on the functionality we want to return rather than the specific type, 
// which in turn allows us to change our mind in the future without breaking the rest of our code. 

// Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

// To demonstrate this we'll use a method on strings called trimmingCharacters(in:) - which removes certain kinds of characters from the start or end of a string

var quote = "   The truth is rarely pure and never simple   "

// if we want to remove the white space, we could do so like this:
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// The .whitespacesAndNewlines value comes from Apple’s Foundation API, and actually so does trimmingCharacters(in:)

// Having to call this every time we make a string is rather wordy so we can make an extension:

// We start with the extension keyword, which tells Swift we want to add functionality to an existing type.
// Which type? Well, that comes next: we want to add functionality to String.
extension String {
  // We’re adding a new method called trimmed(), which returns a new string.
    func trimmed() -> String {
      // Inside there we call the same method as before: trimmingCharacters(in:), sending back its result.
        self.trimmingCharacters(in: .whitespacesAndNewlines)
        // Notice how we can use self here – that automatically refers to the current string. This is possible because we’re currently in a string extension.
    }
}

// and now we can just write:
let trimmed = quote.trimmed()

// We could have also just written a function like:
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

// BUT the extension has some benefits over the global function:
// 1. When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. 
//      This makes our extra functionality easy to find.
// 2. Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. 
//      On the other hand, extensions are naturally grouped by the data type they are extending.
// 3. Because your extension methods are a full part of the original type, they get full access to the type’s internal data. 
//      That means they can use properties and methods marked with private access control, for example.

// Regarding structs, we've seen how Swift automatically generates a memberwise initializer for structs, like this:
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// creating our own initializer means that Swift will no longer provide the memberwise one for us. 
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// WHat if we want both? We could place the custom initializer in an extension and Swift will not disable the memberwise initializer
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types.
// With protocol extensions, we can extend a whole protocol to add method implementations - any types conforming to that protocol get those methods
let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

// but we can fix this with a simple extension for Array like:
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// We added isNotEmpty to arrays, but what about sets and dictionaries? Instead of making extra extentions, we can conform to a built-in protocol called Collection
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// by extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs
protocol Person {
    var name: String { get }
    func sayHello()
}

// That means all conforming types must add a sayHello() method, but we can also add a default implementation of that as an extension like this:
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

// And now conforming types can add their own sayHello() method if they want, but they don’t need to – they can always rely on the one provided inside our protocol extension.
struct Employee: Person {
    let name: String
}

// But because it conforms to Person, we could use the default implementation we provided in our extension:
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()