//
//  UserDetailsRouter.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

protocol UserDetailsRouter {
    func dismiss()
}

class UserDetailsRouterImp: UserDetailsRouter {
    weak var controller: UIViewController!
    private let builder: ControllersBuilder
    
    init(builder: ControllersBuilder) {
        self.builder = builder
    }
    
    func dismiss() {
        controller.dismiss(animated: true, completion: nil)
    }
}
