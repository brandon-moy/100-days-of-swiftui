// This is the input
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Your job is to:

// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format “7 is a lucky number”
// Print the resulting array, one item per line

// The output should look like:
7 is a lucky number
15 is a lucky number
21 is a lucky number
31 is a lucky number
33 is a lucky number
49 is a lucky number

let luckyNumbersFiltered = luckyNumbers
    .filter{$0 % 2 != 0}
    .sorted{$0 < $1}
    .map{"\($0) is a lucky number" }
    
for luckyNumber in luckyNumbersFiltered {
    print(luckyNumber)
}