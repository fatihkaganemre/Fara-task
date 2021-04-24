//
//  UserListInteractor.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

class UserListInteractor {
    private let router: UserListRouter
    
    init(router: UserListRouter) {
        self.router = router
    }
    
    func onTap(user: User) {
        router.showDetails(forUser: user)
    }
}
