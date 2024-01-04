// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it.
// A property storing how many rooms it has.
// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// A property storing the name of the estate agent responsible for selling the building.
// A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
  var rooms: Int { get }
  var cost: Int { get }
  var agent: String { get }
  func salesSummary()
}

struct House: Building {
  var rooms: Int
  var cost: Int
  var agent: String

  func salesSummary() {
    print("This is a House with \(rooms) rooms. \(agent) is the listing agent and the price is $\(cost).")
  }
}

struct Office: Building {
  var rooms: Int
  var cost: Int
  var agent: String

  func salesSummary() {
    print("This is an Office with \(rooms) rooms. \(agent) is the listing agent and the price is $\(cost).")
  }
}

let house = House(rooms: 4, cost: 400_000, agent: "Bob")
house.salesSummary()