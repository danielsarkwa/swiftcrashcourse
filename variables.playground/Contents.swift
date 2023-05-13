import Foundation

// MARK: - VARIABLES

let myName = "Daniel" // cannot be reassigned (immutable)

var yourName = "Foo" // can be reassigned (mutable)

// MARK: - ARRAY
var names = [
    myName,
    yourName
]
/*
    with var, values and assignment can be mutated but need to be of the same type
    with let, values and assignment cannot be mutated
 */

names.append("Bar")
names.append("Baz")

// value types - assigning variables creates a copy of the value in memory
// and changing the root(first) variable doesn't change the value of the second variable as it as already been copied to money
let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"

foo
foo2

// Arrays are structures and structs are value types
let moreNames = [
    "Foo",
    "Bar"
]
var copy = moreNames // creates a copy of the entire array
copy.append("Baz") // this does not affect the original data of moreNames
moreNames
copy


// let with NSMutableArray is a class and values can be changed internally
let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
oldArray.add("Baz")
var newArray = oldArray
newArray.add("Qux")
oldArray
newArray


let someNames = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)

func changeTheArray(_ array: NSArray) { // _ make the parameter name only internally accessible and externally possitional
    let copy = array as! NSMutableArray
    copy.add("Baz")
}
changeTheArray(someNames)
someNames
