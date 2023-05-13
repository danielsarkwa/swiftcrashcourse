import Foundation

// closures are special types of functions that are created inline
// they can be parsed to functions
// they can also be function reference
// they also define function types and data

let add: (Int, Int) -> Int
    = { (lhs: Int, rhs: Int) -> Int in
        lhs + rhs
    }
add(20, 30)

// closures are useful when you want to parse some values and another funtion as children to be used in a parent function where the child function does the work and parent function just calls the children and gives it data
// create a function on the same level as the data but have it working together as a single module
func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using customName: (Int, Int) -> Int
) -> Int {
    customName(lhs, rhs)
}

customAdd(
    13,
    76,
    using: { (lhs: Int, rhs: Int) -> Int in // code editor may replace this with an attrilian syntax
        lhs + rhs
    }
)

// trailing closure syntax
customAdd(
    32,
    34
) { (lhs: Int, rhs: Int) -> Int in // code editor may replace this with an attrilian syntax
    lhs + rhs
}

// swift uses type inference and recognizes function type signatures
customAdd(
    66,
    14
) { (lhs, rhs) -> Int in // code editor may replace this with an attrilian syntax
    lhs + rhs - 2
}

customAdd(22, 3) { $0 + $1 } // $ means representing agument and the number after that represents the index of the argument in function signature

// MARK: - parsing closure to functions
let ages = [30, 20, 19, 40]
ages.sorted(by: <) // accending order // operators in swift are also closures
ages.sorted(by: >) // decending order
ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs < rhs
})

//func < (lhs: Int, rhs: Int) -> Bool {
//    lhs > rhs
//}

func customAdd2(
    using customName: (Int, Int) -> Int,
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    customName(lhs, rhs)
}

customAdd2(using: { lhs, rhs in
    lhs + rhs + 2
}, 30, 55)

// MARK: - parsing functions to closures
func add10To(_ value: Int) -> Int {
    value + 10
}

func add20To(value: Int) -> Int {
    value + 20
}


func doAddition(
    on data: Int,
    using yourFunction: (Int) -> Int
) -> Int {
    yourFunction(data)
}

doAddition(on: 20) { value in
    value + 30
}

doAddition(
    on: 20,
    using: add10To(_:)
)

doAddition(
    on: 20,
    using: add20To(value:)
)
