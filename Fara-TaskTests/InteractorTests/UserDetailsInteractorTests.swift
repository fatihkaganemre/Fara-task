//
//  UserDetailsInteractorTests.swift
//  Fara-TaskTests
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import XCTest
@testable import Fara_Task

class UserDetailsInteractorTests: XCTestCase {
    private var sut: UserDetailsInteractor!
    private var router: UserDetailsRouterMock!
    
    override func setUp() {
        super.setUp()
        router = .init()
        sut = UserDetailsInteractor(router: router, user: .mock)
    }
    
    override func tearDown() {
        sut = nil
        router = nil
        super.tearDown()
    }
    
    func test_viewModel_mapAnnotationTitle() {
        // when
        let viewModel = sut.viewModel()
        
        // then
        XCTAssertEqual(
            viewModel.mapViewModel.mapAnnotationTitle,
            User.mock.address.street + "\n" + User.mock.address.suite
        )
    }
    
    func test_routing_whenBackButtonTapped_shouldDismiss() {
        // when
        sut.viewModel().onBackTapped()
        
        // then
        XCTAssertEqual(router.dismissCalsCount, 1)
    }
}

class UserDetailsRouterMock: UserDetailsRouter {
    var controller: UIViewController!
    
    var dismissCalsCount: Int = 0
    func dismiss() {
        dismissCalsCount += 1
    }
}
