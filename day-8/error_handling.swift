// The throws keyword marks that the function is able to throw an error
func checkPassword(_ password: String) throws -> String {

    if password.count < 5 {
      // When throw happens it exists the function
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// try... catch
// tells the function to try to run a function, and if it is successful it continues BUT if it fails it goes to the catch block
let string = "12345"

do {
  // the try helps show that there is a change that regular execution will be stopped
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}