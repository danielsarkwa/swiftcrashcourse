import Foundation

// classes are reference types and allows mutability

class Person {
    var name: String
    var age: Int
    
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person( // let allows class mutating because they are reference types and it gives access to the data
    name: "Foo", age: 20
)

foo.age
foo.increaseAge()
foo.age

foo.age
let bar = foo // bar points to the same allocated memory of the
bar.age
bar.increaseAge()
bar.age
foo.age

//if foo === bar { } ---- this checks that they have the same reference

// MARK: - inheritance
class Vehicle {
    func goVroom() {
        "Vroom, vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()

class Person2 {
    private(set) var age: Int // set a private property
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let baz = Person2(age: 30)
// baz.age
baz.increaseAge()
baz.age

// MARK: - initializers, designated(they contruct the instance of a call by ensuring that all properties are and that the internal structures hold up) and convinence (they add some logic to the initializer/constructor but leaves the work to the designated constructor), does a part of the work of a contructor but I doesn't really do anything

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    
    convenience init( // this assumes the year is 2023. A convinence initializer cannot call another convinience init
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
        )
    }
}

class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
//        super.init(model: "Y") // you cannot call a super designated initiallizer in a subclass designated initializers
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar) // this still pasrses the momory reference of the class to the function
fooBar.age

// MARK: - de-initializers, releases class memory when it's getting full
class MyClass {
    init() {
        "init"
    }
    func doSomething() {
        "do something"
    }
    deinit {
        "deinitialized"
    }
}

let myClosure = {
    let myClass = MyClass()
}
myClosure()
