import Foundation

// they add functionality to existing types and they extend funcitonality to existing types

extension Int {
    func plusTwo() -> Int {
        self + 2 // represents the current instance of the type; the value
    }
}

let two = 2
two.plusTwo()

// get a custom like constructor withot using init to replace the default init
struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName
        )
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

// extend exising type and add conformance to existing type
protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(
    manufacturer: "Tesla",
    model: "X"
)

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

modelX.goVroom()

// having extensions on classes with convinence initialisers (extend data types and add convinence to them)

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

MyDouble().value

// extending exisit protocols
extension GoesVroom {
    func goesVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}
modelX.goesVroomEvenMore()
