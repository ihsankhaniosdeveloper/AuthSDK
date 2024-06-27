//
//  AuthManagerTests.swift
//  AuthSDKTests
//
//  Created by Ahmed Durrani on 27/06/2024.
//

import XCTest
@testable import AuthSDK
class AuthManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    f

    func testLogin() {
        let expectation = self.expectation(description: "Login")
        AuthManager.shared.login(email: "test@example.com", password: "password") { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user.email, "test@example.com")
            case .failure(let error):
                XCTFail("Login failed with error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
