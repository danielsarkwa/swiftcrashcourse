import Foundation

// protocols works with interfaces, these are set of rules the an object which conforms to a protocol has to follow

protocol CanBreathe {
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        "Animal can breathing...."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person can breathing...."
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

// MARK: - protocols with declarable functions
protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

// let canJump = CanJump() // this is wrong because you can't instantiate a protocol, you need to instantiate an object that can jump
struct Cat: CanJump {
    // we won't get an error if the jump() function is not stated because the protocol has an extention of the function
    
}
let whiskers = Cat()
whiskers.jump()

// MARK: - protocols with variables
protocol HasName {
    var name: String { get } // a variable that can be read from
    var age: Int { get set } // a variable that can be read from and set to
    mutating func increaseAge()
}

// protocols helps use to know what to expect, and also gives access to the things you need to write a function or any other thing
extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String // because the protocol is a getter, it's a read-only variable
    var age: Int
}

var woof = Dog(
    name: "Woof",
    age: 10
)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()
woof.age

// MARK: - mutating fuctions in protocols
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value :Int)
}

extension Vehicle {
    mutating func increaseSpeed(
        by value :Int
    ) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

// MARK: - protocols used as conformance blueprints ("is" - can be used to check if an object conforms to a protocol or not)
func describe(obj: Any) {
    if obj is Vehicle {
        "obj conforms to the Vehicle protocol"
    } else {
        "does not conform"
    }
}
describe(obj: bike)

// MARK: - using the "as" syntax in protocols - "as" is used to promote a variable type when type is true after check
func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This is not a vehicle"
    }
}
increaseSpeedIfVehicle(obj: bike)
increaseSpeedIfVehicle(obj: foo)
