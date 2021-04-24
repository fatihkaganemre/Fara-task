//
//  UserDetailsView.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct UserDetailsViewModel {
    let onBackTapped: () -> Void
}

class UserDetailsView: UIView {
    init(viewModel: UserDetailsViewModel) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
