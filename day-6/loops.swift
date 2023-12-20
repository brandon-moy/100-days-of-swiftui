// Loops
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// for ITEM in VARIABLE - loops through the variable and run the code for each item inside the variables
for os in platforms {
    print("Swift works great on \(os).")
}

// the name os can be changed and also called as a variable for the item in the array
for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken).")
}

// We can also loop over a fixed array of numbers
// the ... creates a range between 1 and 12 inclusive of the outer boundary numbers
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// we can also swap the last . for a < to be non-inclusive of the final number
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// While loops are another type of loop that run until the condition is false
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")


// Skipping loops items with break and continue

// continue is used when looping to stop executing the current loop and then jump to the next item in the loop
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
  // checks is the file is an image, if not it skips that iteration, and continues on the next item
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// break is used to exit the loop

// searching for common multiples of two numbers and stopping when we hit 10
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
  // checks both multiples here
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
      // if it is true, we add it to the list
        multiples.append(i)

      // check if we have ten
        if multiples.count == 10 {
          // if true we exit the loop
            break
        }
    }
}

print(multiples)