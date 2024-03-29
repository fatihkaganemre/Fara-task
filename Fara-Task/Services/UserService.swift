//
//  UserListService.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

protocol UserService {
    func fetchUsers(_ completion: @escaping ((Result<[User], Error>) -> Void))
}

class UserServiceImp: UserService {
    private let webServiceCore: WebServiceCore
    
    init(webServiceCore: WebServiceCore = WebServiceCoreImp()) {
        self.webServiceCore = webServiceCore
    }
    
    func fetchUsers(_ completion: @escaping ((Result<[User], Error>) -> Void)) {
        webServiceCore.performRequest(
            "https://jsonplaceholder.typicode.com/users",
            responseParsing: .decodeJSON(),
            completion: completion
        )
    }
}
