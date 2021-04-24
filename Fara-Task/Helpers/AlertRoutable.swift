//
//  AlertRoutable.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

protocol AlertRoutable: Router {
    func present(alert: AlertViewModel)
}

extension AlertRoutable {
    func present(alert: AlertViewModel) {
        let actions = alert.actions.map { action in
            UIAlertAction(
                title: action.title,
                style: action.style,
                handler: { _ in action.onTapped?() }
            )
        }
        let alertController = UIAlertController(
            title: alert.title,
            message: alert.message,
            preferredStyle: alert.style
        )
        actions.forEach { alertController.addAction($0) }
        controller?.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
}

