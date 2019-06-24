//
//  Lumatouch_ChallengeUITests.swift
//  Lumatouch ChallengeUITests
//
//  Created by Cody on 6/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import XCTest

class Lumatouch_ChallengeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testExample() {
        //Sets up app and identify the button to be tapped
        let app = XCUIApplication()
        //Verifies Begin and Cancel Buttons
        let beginButton = app.buttons["Begin"]
        let cancelButton = app.buttons["Cancel"]
        //Sets up an expectation that the label should change to "Ready". This will have the test wait to hit the begin button again until the timer has counted down to 0 and started over
        let timerFinished = app.staticTexts["Ready"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: timerFinished, handler: nil)
        //Taps button to start the first countdown from 10 - 0
        beginButton.tap()
        //Verifies that button was changed to cancel after tap
        expectation(for: exists, evaluatedWith: cancelButton, handler: nil)
        //Waits for previous expectation. Timeout after 15 seconds. Should only need to wait for 10.
        waitForExpectations(timeout: 15, handler: nil)
        //Sets up another expectation that the text will read "8".
        let twoSecondsPass = app.staticTexts["8"]
        expectation(for: exists, evaluatedWith: twoSecondsPass, handler: nil)
        //Start timer
        beginButton.tap()
        //Waits until the timer hits 8 seconds. Timeout of 5 seconds.
        waitForExpectations(timeout: 5, handler: nil)
        //Cancels the timer after waiting til there are 8 seconds left.
        cancelButton.tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
