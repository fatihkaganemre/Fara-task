//
//  UIViewExtensions.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

extension UIView {
    func addSubviewForAutolayout(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func fill(withView view: UIView) {
        addSubviewForAutolayout(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
