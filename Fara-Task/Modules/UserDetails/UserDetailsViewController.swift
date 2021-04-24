//
//  UserDetailsViewController.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

class UserDetailsViewController: UIViewController {
    private let interactor: UserDetailsInteractor
    
    init(interactor: UserDetailsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = UserDetailsView(viewModel: interactor.viewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
