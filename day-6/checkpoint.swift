// Initial solution to "FizzBuzz"
for i in 1...100 {
  if i % 3 == 0 && i % 5 == 0 {
    print("FizzBuzz")
  } else if i % 3 == 0 {
    print("Fizz")
  } else if i % 5 == 0 {
    print("Buzz")
  } else {
    print(i)
  }
}

// Solution to "FizzBuzz" after hints - uses isMultiple instead of the modulo operator
for i in 1...100 {
  if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
    print("FizzBuzz")
  } else if i.isMultiple(of: 3) {
    print("Fizz")
  } else if i.isMultiple(of: 5) {
    print("Buzz")
  } else {
    print(i)
  }
}