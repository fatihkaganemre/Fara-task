//
//  MockHelpers.swift
//  Fara-TaskTests
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
@testable import Fara_Task

extension User {
    static var mock: User {
        .init(
            id: 1,
            name: "name",
            username: "username",
            email: "email",
            address: .init(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: .init(lat: "lat", lng: "lng")),
            phone: "phone",
            website: .mock,
            company: .init(name: "name", catchPhrase: "catchPhrase", bs: "bs")
        )
    }
}

extension URL {
    static var mock: URL {
        URL(string: "www.example.mock")!
    }
}

enum TestError: Error {
    case any
}
