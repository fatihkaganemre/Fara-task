//
//  User.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: URL
    let company: Company
    
    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
        
        struct Geo: Decodable {
            let lat: String
            let lng: String
        }
        
        var openAddress: String {
            "\(street), \(suite)\n" + "\(zipcode) \(city)"
        }
    }
    
    struct Company: Decodable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}
