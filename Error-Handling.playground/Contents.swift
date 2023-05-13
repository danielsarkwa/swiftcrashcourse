import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameisNil
        case lastNameisNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case (.none, .some):
            throw Errors.firstNameisNil
        case (.some, .none):
            throw Errors.lastNameisNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(
    firstName: "foo",
    lastName: nil
)

// catch all errors
do {
    let fullName = try foo.getFullName()
} catch {
    "Got and error = \(error)"
}

// catch error types - belonging to something
do {
    let fullName = try foo.getFullName()
} catch is Person.Errors {
    "Got and error"
}


// catch spefici errors
do {
    let fullName = try foo.getFullName()
    fullName
} catch Person.Errors.firstNameisNil {
    "First name is nil"
} catch Person.Errors.lastNameisNil {
    "Last name is nil"
}

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
}

let myCar = Car(manufacturer: "")
