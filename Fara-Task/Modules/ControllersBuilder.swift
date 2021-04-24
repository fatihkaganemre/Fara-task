//
//  ControllersBuilder.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct ControllersBuilder {
    func buildUserListController() -> UIViewController {
        let router = UserListRouterImp(builder: self)
        let interactor = UserListInteractor(router: router)
        let controller = UserListViewController(interactor: interactor)
        router.controller = controller
        return controller
    }
    
    func buildUserDetailsController(user: User) -> UIViewController {
        let router = UserDetailsRouterImp(builder: self)
        let interactor = UserDetailsInteractor(router: router, user: user)
        let controller = UserDetailsViewController(interactor: interactor)
        router.controller = controller
        return controller
    }

}
