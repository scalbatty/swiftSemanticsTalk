//: [Previous](@previous)

//: # Fun with Domain Logic

import Foundation

//: ## An EmailAddress type that only yields an instance for a valid email address

struct EmailAddress: RawRepresentable, Equatable {
    let rawValue: String

    init?(rawValue: String) {
        guard EmailAddress.stringIsValidEmail(rawValue) else { return nil }
        self.rawValue = rawValue
    }

    private static func stringIsValidEmail(_ string: String) -> Bool {
        return string.contains("@")
    }
}

//: `RawRepresentable` + Swift 4.1 means Equatable is free!

let emailA = EmailAddress(rawValue: "pascal@semantics.com")
let invalidEmail = EmailAddress(rawValue: "pascal_at_semantics_dot_com")
let emailB = EmailAddress(rawValue: "pascal@swift.io")

emailA == emailB

//: ## An Either-Or-OrBoth type

struct PhoneNumber {}

struct BasicContactInfo { // Can have one, the other, both… or none!
    let emailAddress: EmailAddress?
    let phoneNumber: PhoneNumber?
}

enum SafeContactInfo {
    case email(EmailAddress)
    case phone(PhoneNumber)
    case emailAndPhone(EmailAddress, PhoneNumber)
}

enum AtLeastOneOf<T, U> {
    case left(T)
    case right(U)
    case both(T, U)
}
