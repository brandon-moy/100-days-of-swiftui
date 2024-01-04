// Your challenge is this: make a class hierarchy for animals, 
// starting with Animal at the top, 
// then Dog and Cat as subclasses, 
// then Corgi and Poodle as subclasses of Dog, 
// and Persian and Lion as subclasses of Cat.

// The Animal class should have a legs integer property that tracks how many legs the animal has.
// The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// The Cat class should have a matching speak() method, again with each subclass printing something different.
// The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
  let legs: Int
  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }

  func speak() {
    print("Bark bark")
  }
}

class Corgi: Dog {
  override func speak() {
    print("Arf arf")
  }
}

class Poodle: Dog {
  override func speak() {
    print("Bow wow")
  }
}

class Cat: Animal {
  let isTame: Bool

  init(isTamed: Bool) {
    self.isTame = isTamed
    super.init(legs: 4)
  }

  func speak() {
    print("Meow")
  }
}

class Persian: Cat {
  init() {
    super.init(isTamed: true)
  }

  override func speak() {
    print("Mew")
  }
}

class Lion: Cat {
  init() {
    super.init(isTamed: false)
  }

  override func speak() {
    print("ROAAAAR")
  }
}

let larry = Corgi()
let moe   = Poodle()
let curly = Persian()
let shemp = Lion()

print ("Larry is a dog with \(larry.legs) legs. Larry says ")
larry.speak()
print ("Moe is a dog with \(moe.legs) legs. Moe says ")
moe.speak()
print ("Curly is a " + (curly.isTame ? "tame " : "wild ") + "cat with \(curly.legs) legs. Curly says ")
curly.speak()
print ("Shemp is a " + (shemp.isTame ? "tame " : "wild ") + "cat with \(shemp.legs) legs. Shemp says")
shemp.speak()