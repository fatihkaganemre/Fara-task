//
//  UserDetailsInteractor.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

class UserDetailsInteractor {
    private let router: UserDetailsRouter
    
    init(router: UserDetailsRouter, user: User) {
        self.router = router
    }
    
    func viewModel() -> UserDetailsViewModel {
        return .init(onBackTapped: { [router] in router.dismiss() })
    }
}
