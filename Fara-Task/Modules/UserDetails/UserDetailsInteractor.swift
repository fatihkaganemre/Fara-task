//
//  UserDetailsInteractor.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

class UserDetailsInteractor {
    private let router: UserDetailsRouter
    private let user: User
    
    init(router: UserDetailsRouter, user: User) {
        self.router = router
        self.user = user
    }
    
    func viewModel() -> UserDetailsViewModel {
        return .init(
            onBackTapped: { [router] in router.dismiss() },
            userBasicInfo: .init(name: user.name, address: user.address.openAddress),
            mapViewModel: .init(
                mapAnnotationTitle: user.address.street + "\n" + user.address.suite,
                latitute: user.address.geo.lat,
                longitute: user.address.geo.lng
            ),
            email: user.email,
            phone: user.phone,
            company: user.company.name
        )
    }
}
