// Initialize variables with arrays using []
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

//  Can access elements based on index
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// The append method is used to add to arrays
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

// Swift does check the TYPE of data in an array so you cannot add different data types to an array

// this is not okay since temperatures is an array of doubles
temperatures.append("Chris")

// Example of creating an empty array and adding items one by one
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// you can also define an array of a data type by surrounding the data type on brackets
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// .count can be used to remove items from an array and remove(at:) can remove a specific index or removeAll() can remove all items
var characters = ["Lana", "Pam", "Ray", "Sterling"]
// prints 4
print(characters.count)

characters.remove(at: 2)
// prints 3
print(characters.count)

characters.removeAll()
// prints 0
print(characters.count)

// You can check if an array contains an item by using the contains() method
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// You can also sort arrays using sorted()
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

// You can reverse an array with reversed()
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)