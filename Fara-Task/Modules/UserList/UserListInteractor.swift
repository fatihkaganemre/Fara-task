//
//  UserListInteractor.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

class UserListInteractor {
    private let router: UserListRouter
    private(set) var users: [User]? {
        didSet {
            self.reoladTable()
        }
    }
    var reoladTable: () -> Void = {}
    
    init(router: UserListRouter) {
        self.router = router
        
        UserService(webServiceCore: WebServiceCoreImp()).fetchUsers { [unowned self] result in
            switch result {
            case let .success(users):
                self.users = users
            case let .failure(error): break
            }
        }
    }
    
    func onTap(user: User) {
        router.showDetails(forUser: user)
    }
}
