//
//  AlertViewModel.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct AlertViewModel {
    let title: String?
    let message: String?
    let style: UIAlertController.Style
    let actions: [AlertActionViewModel]
}

struct AlertActionViewModel {
    let title: String?
    let style: UIAlertAction.Style
    let onTapped: (() -> Void)?
}

extension AlertViewModel {
    static func requestFailedAlert(errorMessage: String) -> AlertViewModel {
        let okAction = AlertActionViewModel(
            title: "Ok",
            style: .default,
            onTapped: nil
        )
        return AlertViewModel(
            title: "Error",
            message: errorMessage,
            style: .alert,
            actions: [okAction]
        )
    }
}
