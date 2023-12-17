let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)
// prints ["Samuel L Jackson", "Nicholas Cage", "Tom Cruise", "Denzel Washington"] or in any order as a set does not care in that order

// Unlike an array, we do not append since order does not matter but we insert into a set
var actors = Set<String>()
actors.insert("Denzel Washington")
actors.insert("Tom Cruise")
actors.insert("Nicolas Cage")
actors.insert("Samuel L Jackson")

// So why use sets over arrays?

// Sets must has unique stored names so duplicates are not allowed

// Sets also store information in a highly optimized order that makes it easy to locate items
// using contains on an array on something like 1000 names will have to go through each name until it finds (or doesn't find) the name
// a set will search the 1000 names ridiculously fast

// You can also sort a set which returns a sorted array with the sets items