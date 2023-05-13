import Foundation

// Enumerations are categorization of values/data that are named
// enums are values and types

enum Animals {
    //case bat, mouse, bird
    case cat
    case dog
    case rabbit
}


let cat = Animals.cat
cat

if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog { // comparison only works with the same instance types
    "This is a dog"
} else {
    "This is something else"
}

switch cat { // this is better for ensuring all cases of the enums are covered in your code
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
default: // switch case on enums should be exaustive (it should cover all the possible types) // this falls on anything that is not covered in the cases but could be stated in the enum definition
    "This is something else"
}

// MARK: - associative values - there is not equality of the enum values, they act as types, variable names that can hold anything but not stored in a single location in memory
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

// there is not equality of the enum values
switch wwwApple {
case .fileOrFolder(
    path: let p,
    name: let n
):
    p
    n
    break
case .wwwUrl(
    path: let p
):
    p
    break
case .song(
    artist: let a,
    songName: let s
):
    a
    s
    break
}

switch wwwApple {
case .fileOrFolder(
    let p,
    let n
):
    p
    n
    break
case .wwwUrl(
    let p
):
    p
    break
case .song(
    let a,
    let s
):
    a
    s
    break
}

switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(p):
    p
    break
case let .song(artist, songName):
    artist
    songName
    break
}

// check if a variable contains the type of an enum
if case let .wwwUrl(path) = wwwApple {
    path
}

// ignore values in enum
let withoutYou = Shortcut.song(
    artist: "Symp X",
    songName: "Without You"
)

if case let .song(_, songName) = withoutYou {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    var manufacturer: String { // using computered values // returns the value of known properties
        switch self {
        case let .car(manufacturer, _), // this uses pattern mapping, the same type with the same name can be used in the function
         let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Tesla", model: "X"
)
car.manufacturer

let bike = Vehicle.bike(
    manufacturer: "HD", yearMade: 1783
)
bike.manufacturer

// MARK: - enums with exact data
enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mum"
    case brother = "Bro"
}

FamilyMember.father.rawValue

enum Language: String, CaseIterable {
    case english = "English"
    case french = "French"
    case akan = "Akan"
}

Language.allCases
Language.allCases.map(\.rawValue)

if let myLanguage = Language(rawValue: "Akan") {
    "Found my language"
    myLanguage
} else {
    "This language does not exit"
}

if let german = Language(rawValue: "German") {
    "It can speak, really!"
    german
} else {
    "As expected I can't speak German"
}

// MARK: - mutating members
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

// MARK: - indirect or recursive enumerations
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freehand(IntOperation)
}
