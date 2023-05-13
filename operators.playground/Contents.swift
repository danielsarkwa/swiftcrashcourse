import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    "I'm older than you"
} else if myAge < yourAge { // runs only when the above condition returns false
    "I'm younger than you"
} else { // runs only when the above condition returns false
    "Oh hey, we are the same age"
}

let myMothersAge = yourAge + 30
let doubleMyAge = myAge * 2

/**
 TYPES OF OPERATORS
  1. Unary prefix - working with one value
  2. Unary postfix
  3. Binary infix - working with two values (+, *)
 */

// Unary prefix
let foo = !true // negates the value (used before the value)

// Unary postfix
let name = Optional("Daniel") // optional means null values or values
type(of: name)
let unaryPostFix = name! // forces the exact value out as defined in the written code
type(of: unaryPostFix)

// Binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"

// MARK: - Ternary Operators
let age = 30
//let message: String
//if age >= 18 {
//    message = "You are an adult"
//} else {
//    message = "You are not yet an adult"
//}

let message = age >= 18 // CONDITION
    ? "You are an adult" // VALUE IF CONDITION IS MET
    : "You are not yet an adult" // VALUE IF CONDITION IS NOT MET

