import Foundation

// this indicates a value that might or might not be present

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(45)

let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! It's value is \(age)"
} else {
    "No age is present. As expected"
}

// if your function depends on optional values
func checkAge() {
    guard age != nil else {
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!!"
}
checkAge()

// unwrapping an optional
let age2: Int? = 0
func checkAge2() {
    guard let age2 else {
        "Age is nil. How strange"
        return
    }
    "Age is not nil as expected. value = \(age2)"
}
checkAge2()

switch age2 {
case .none:
    "Age is no value as expected"
    break
case let .some(value):
    "Age has value of \(value)"
    break
}

if age2 == 0 {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

if age2 == .some(0) {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

// optional chaning - optionally access the methods of a struct
struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(
    name: "Foo",
    address: nil
)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Doesn't have address"
}

let bar: Person? = Person(
    name: "bar",
    address: Person.Address(firstLine: nil)
)

if bar?.name == "Bar",
   bar?.address?.firstLine == nil  {
        "Bar's name is bar and has no first line of address"
} else {
    "seems like something isn't working"
}

let baz: Person? = Person(
    name: "Baz",
    address: Person.Address(firstLine: "Baz first line")
)

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "baz first line is \(firstLine)"
case let .some(firstLine):
    "baz first address line doesn't match case"
    firstLine
case .none:
    "line  is nil"
}

func getFullName2 (
    firstName: String,
    lastName: String?
) -> String? {
    guard let lastName else {
        return nil
    }
    return "\(firstName) \(lastName)"
}
