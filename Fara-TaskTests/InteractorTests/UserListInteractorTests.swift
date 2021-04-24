//
//  UserListInteractorTests.swift
//  Fara-TaskTests
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import XCTest
@testable import Fara_Task

class UserListInteractorTests: XCTestCase {
    private var sut: UserListInteractor!
    private var router: UserListRouterMock!
    private var userService: UserServiceMock!
    
    override func setUp() {
        super.setUp()
        router = .init()
        userService = .init()
        userService.fetchUserReturnValue = .success([])
        sut = UserListInteractor(router: router, userService: userService)
    }
    
    override func tearDown() {
        sut = nil
        router = nil
        userService = nil
        super.tearDown()
    }
    
    func test_whenFetchUser_shouldFetchUsers() {
        // given
        userService.fetchUserReturnValue = .success([])
        
        // when
        sut.fetchUsers()
        
        // then
        XCTAssertEqual(userService.fetchUserCallsCount, 1)
    }
    
    func test_whenFetchUserFails_shouldPresentAlert() {
        // given
        userService.fetchUserReturnValue = .failure(TestError.any)
        
        // when
        sut.fetchUsers()
        
        // then
        XCTAssertEqual(router.presentAlertCallsCount, 1)
    }
    
    func test_whenFetchUserSucceds_shouldDisplayUsers() {
        // given
        let users = [User.mock]
        userService.fetchUserReturnValue = .success(users)
        
        // when
        sut.fetchUsers()
        
        // then
        XCTAssertEqual(sut.users!.first!.id, User.mock.id)
    }
    
    func test_routing_whenUserTapped_shouldShowDetailsWithCorrectUser() {
        // given
        let user = User.mock
        
        // when
        sut.onTap(user: user)
        
        // then
        XCTAssertEqual(router.receivedUser?.id, user.id)
        XCTAssertEqual(router.showDetailsCallsCount, 1)
    }
}

private class UserListRouterMock: UserListRouter {
    var controller: UIViewController!
    
    var receivedUser: User? = nil
    var showDetailsCallsCount: Int = 0
    func showDetails(forUser user: User) {
        receivedUser = user
        showDetailsCallsCount += 1
    }
    
    var presentAlertCallsCount: Int = 0
    func present(alert: AlertViewModel) {
        presentAlertCallsCount += 1
    }
}

private class UserServiceMock: UserService {
    var fetchUserReturnValue: (Result<[User], Error>)? = nil
    var fetchUserCallsCount: Int = 0
    func fetchUsers(_ completion: @escaping ((Result<[User], Error>) -> Void)) {
        completion(fetchUserReturnValue!)
        fetchUserCallsCount += 1
    }
}
