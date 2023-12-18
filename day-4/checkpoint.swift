// Checkpoint 2

// Create an array of string, then write some code that prints the number of items in the array and also the number of unique items in the array
let strings : [String] = ["Brandon", "Arjun", "Anthony", "Brandon", "Derrick"]
let stringsSet : Set<String> = Set(strings)

print(strings.count)
print(stringsSet.count)
