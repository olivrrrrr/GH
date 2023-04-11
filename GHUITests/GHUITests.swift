//
//  GHUITests.swift
//  GHUITests
//
//  Created by Oliver Ekwalla on 02/03/2023.
//

import XCTest

final class GHUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    private var searchFollowersButton: XCUIElement {
        return XCUIApplication().buttons["Search followers"]
    }
    
    private var usernameTextField: XCUIElement {
        return XCUIApplication().textFields["Enter a username"]
    }
    
    func whenISelectSearchFollowersButton() {
        XCTContext.runActivity(named: #function) { _ in
            searchFollowersButton.tap()
        }
    }
    
    func whenITapUsernameFieldAndWriteDetails() {
        XCTContext.runActivity(named: #function) {_ in
            usernameTextField.tap()
            usernameTextField.typeText("olivrrrrr\n")
        }
    }
    
    func thenIShouldSeeSearchFollowersButton() {
        XCTAssertTrue(searchFollowersButton.exists)
    }
    
    func thenIShouldSeeUsernameTextField() {
        XCTAssertTrue(usernameTextField.exists)
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        thenIShouldSeeUsernameTextField()
        whenITapUsernameFieldAndWriteDetails()
    
        XCUIApplication().collectionViews.firstMatch
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
