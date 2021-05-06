//
//  UserListInteractor.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

class UserListInteractor {
    private let router: UserListRouter
    private let userService: UserService
    private(set) var users: [User]? {
        didSet {
            self.reoladTable()
        }
    }
    var reoladTable: () -> Void = {}
    
    init(
        router: UserListRouter,
        userService: UserService = UserServiceImp()
    ) {
        self.router = router
        self.userService = userService
    }
    
    func onTap(user: User) {
        router.showDetails(forUser: user)
    }
    
    func fetchUsers() {
        userService.fetchUsers { [unowned self, router] result in
            switch result {
            case let .success(users):
                self.users = users
            case let .failure(error):
                router.present(alert: .requestFailedAlert(errorMessage: error.localizedDescription))
            }
        }
    }
}
