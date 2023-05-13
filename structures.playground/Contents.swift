import Foundation

// structures are ways of grouping data together and giving them a name of some sought
// they are value types, data are copied when they are assigned to a new variable

struct Person { // constructors are implicitly created by compilers, every property has it's own constructor
    let name: String
    let age: Int
}

// instantiation
let foo = Person(
    name: "Foo",
    age: 20
)

// . dot notation - ways of accessing the data
foo.name
foo.age

// MARK: - constructor
struct CommodoreComputer {
    let name: String
    let manufacturer: String
    // let manufacturer = "Commodore" // if you don't want to write the whole init thing
    // acts as the constructor to initialize the structure
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodoreComputer(name: "c64")
c64.name
c64.manufacturer

// MARK: - computered properties
struct Person2 {
    let firstName: String
    let lastName: String
    var fullNall: String { // a variable with a function is a computer property
        "\(firstName) \(lastName)"
    }
    
//    init(
//        firstName: String,
//        lastName: String
//    ) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.firstName = "\(firstName) \(lastName)"
//    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
fooBar.firstName
fooBar.lastName
fooBar.fullNall

// MARK: - mutable struct
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) { // this bends the rule for how structs works using a function
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10) // this is immutable because of the let annotation and because the struct has internal mutation within - let closes the door to access the data given it initially
// immutableCar.drive(speed: 20) // because of let, this change is accessing the instance's location in memory for change and let prevents that (it's assigned data doesn't change in anyway), maybe inside it can change but you don't have access to change that

var mutableCar = Car(currentSpeed: 30)
mutableCar.drive(speed: 50)
mutableCar.currentSpeed
let copy = mutableCar // this copy the data over to the new variable and they are not connected
mutableCar.drive(speed: 40)
mutableCar.currentSpeed
copy.currentSpeed

// MARK: - structs don't have subclasses
//struct Volvo: Car {
//
//}

// MARK: - custom copying of content with custom logic
struct Bike {
    let manufacturer: String
    let currendSpend: Int
    func customCopy(currentSpeed: Int) -> Bike {
        Bike(
            manufacturer: self.manufacturer,
            currendSpend: currentSpeed
        )
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currendSpend: 20
)

// below, we are copying to change logic
//let bike2 = bike1
//bike2.currendSpend = 30
let bike2 = bike1.customCopy(currentSpeed: 30)
bike1.currendSpend
bike2.currendSpend
bike2.manufacturer
