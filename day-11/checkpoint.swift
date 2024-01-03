// Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down.

struct Car {
  let model: String
  let numberOfSeats: Int
  private(set) var currentGear: Int

  init(model: String, seats: Int, gear: Int) {
    self.model = model
    self.numberOfSeats = seats
    self.currentGear = gear
  }

  mutating func shiftUp() {
    if (gear == 10) {
      print("You're already in the top gear!")
    } else {
      currentGear += 1
      print("You are now in gear \(currentGear)")
    }
  }

  mutating func shiftDown() {
    if (gear == 1) {
      print("You're already in the lowest gear!")
    } else {
      currentGear -= 1
      print("You are now in gear \(currentGear)")
    }
  }
}

var prefect = Car(model: "Mazda", seats: 3, gear: 3)
prefect.shiftUp()
prefect.shiftUp()
prefect.shiftDown()
