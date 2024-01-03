// sometimes you want to hide some data from external access. For example,
//  maybe you have some logic you need to apply before touching your properties, 
//  or maybe you know that some methods need to be called in a certain way or order, and so shouldn’t be touched externally.

// Lets take this example:
struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// That has methods to deposit and withdraw money from a bank account, and should be used like this:

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// But the funds property is just exposed to us externally, so what’s stopping us from touching it directly? The answer is nothing at all – this kind of code is allowed:
account.funds -= 1000

// This bypasses the logic we put in place to stop taking out more money

// We can tell Swift to make variables only be accessible inside of the struct - by methods that belong to the struct as well as any computed property observers, and so on
// and it only takes one extra word - private
private var funds = 0

// And now accessing funds from outside the struct isn’t possible, but it is possible inside both deposit() and withdraw(). 
// If you try to read or write funds from outside the struct Swift will refuse to build your code.

// Swift provides several options for access control
// - private for "don't let anything outside the struct use this"
// - fileprivate for "don't let anything outside the current file use this"
// - public for "let anyone, anywhere use this"

// There’s one extra option that is sometimes useful for learners, which is this: private(set). This means “let anyone read this property, but only let my methods write it.

