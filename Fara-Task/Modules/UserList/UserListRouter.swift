//
//  UserListRouter.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

protocol UserListRouter: AlertRoutable {
    func showDetails(forUser user: User)
}

class UserListRouterImp: UserListRouter {
    weak var controller: UIViewController!
    private let builder: ControllersBuilder
    
    init(builder: ControllersBuilder) {
        self.builder = builder
    }
    
    func showDetails(forUser user: User) {
        let controller = builder.buildUserDetailsController(user: user)
        controller.modalPresentationStyle = .fullScreen
        present(controller: controller)
    }
}
