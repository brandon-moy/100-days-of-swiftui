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

