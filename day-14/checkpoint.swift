// Checkpoint 9

// Write a function that accepts an optional array of integers and returns one of those integers randomly
// if the array is missing or empty - return a new random number in the range 1 through 100
// write the function in a single line of code


// currently accepts optional array and returns one number
// and returns random number in range if array is empty
func initialThoughts(_ numbers: [Int]?) -> Int {
  guard let random = numbers?.randomElement() else {
    return Int.random(in: 1...100)
  }
  
  return random
}
