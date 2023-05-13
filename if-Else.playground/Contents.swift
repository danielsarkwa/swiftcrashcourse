import Foundation

let myName = "Daniel"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "Emma" {
    "Your name is \(myName)"
} else {
    "Opps, I gussed it wrong"
}

if myName == "Daniel" {
    "Now I guessed it correctly"
} else if myName == "Foo" { // this runs when the above returns false
    "Are you Foo?"
} else {
    "Okay I give up"
}

if "Daniel" == myName {
    "An uncommon way of doing this"
}

if myName == "Daniel" && myAge == 30 {
    "Name is Daniel and age is 30"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "I don't know what I'm doing"
}

if myAge == 20 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myName == "Daniel" || myAge == 20 {
    "It's too late to get in this clause"
}

if myName == "Daniel"
    && myAge == 22
    && yourName  == "Foo"
    || yourAge == 19 {
    "My name is Daniel and I'm 22 and your name is Foo...OR.. you are 19"
}

if (myName == "Daniel" && myAge == 22)
    &&
    (yourName  == "Foo" || yourAge == 19) {
    "My name is Daniel and I'm 22 and your name is Foo...OR.. you are 19"
} else {
    "I'm wrong"
}
