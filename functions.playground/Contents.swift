import Foundation

func noArgumentsAndNoReturnValue() {
    "It doesn't have anything"
}

noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)

func newPlusTwo(value: Int) -> Int {
    value + 2
}

newPlusTwo(value: 30)

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}
let customAdded = customAdd(
    value1: 10,
    value2: 20
)

func customMinus(
    _ lhs: Int, // _ means the paramters should not have argument names, so parameters names are only accessible internally
    rightHandSide rhs: Int // _ using a char will be the external accsible argument name
) -> Int {
    lhs - rhs
}
let customSubtracted = customMinus(20, rightHandSide: 10)

// this has to be consumed in pure swift, remember to use a variable and use that variable; let consumer = func someFunction() {}
customAdd(
    value1: 10,
    value2: 20
)

@discardableResult // used when you don't want to consume the value from the function
func myCustomMinus(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs - rhs
}

myCustomMinus(30, 15)

func doSomethingComplicated(
    with value: Int
) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}
doSomethingComplicated(with: 30)

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}

getFullName() // call without arguments
getFullName(firstName: "Bazz") // with one argument
getFullName(firstName: "Bazz", lastName: "Aux") // with both argument
