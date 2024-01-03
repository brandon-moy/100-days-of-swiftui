// You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.

// Structs can have variable and constants (known as properties) and functions (known as methods)

// If a method tries to modify properties of its struct, you must mark it as mutating.

// You can store properties in memory, or create computed properties that calculate a value every time they are accessed.

// We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.

// Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.

// You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.

// We can use access to mark any properties and methods as being available or unavailable externally, as needed.

// It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.