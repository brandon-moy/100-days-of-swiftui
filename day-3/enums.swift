// Enums - short for enumeration - is a set of named values we can create and use in code

// Eample scenario: code that lets the user select a day of the week
var selected = "Monday"
// later changes to:
selected = "Tuesday"
// what happens if. . . a month? or mistype?
selected = "January"
selected = "Frday"

// instead we can make an enum with a range of values we can have so that it removes the chance of a mistake with the item
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// then instead of strings we just use the enum
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

// we can also just say case once and then separate the cases with commas
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

// we can also just use .value after we use the enum once, the data type becomes fixed
var day = Weekday.monday
day = .tuesday
day = .friday

