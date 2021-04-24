//
//  Router.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

protocol Router {
    var controller: UIViewController! { get }
}

extension Router {
    func present(controller: UIViewController) {
        self.controller.present(controller, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.controller.dismiss(animated: true, completion: nil)
    }
}
