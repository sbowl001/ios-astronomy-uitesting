//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Stephanie Bowles on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        print(app)
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSwipeDown() {
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.swipeDown()
        
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        element.swipeDown()
        app.navigationBars["Title"].buttons["Sol 14"].tap()
        element.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    func testLoadImage() {
        let app = XCUIApplication()
       app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailViewController.SaveButton"].exists)
        XCTAssert(app.navigationBars["Title"].exists)
        
        
        let element2 = app.collectionViews.element.children(matching: .other).element
        
        XCTAssert(element2.exists)
        
         
        
    }
    
    func testSaveImage(){
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
        
    }
    func testGoToNextSol() {
        
        let app = XCUIApplication()
        
      
       let nextSolButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
        
  
}
    
    func testGoToPreviousSol() {
        
        let app = XCUIApplication()
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       
       XCTAssert(app.navigationBars["Sol 14"].exists)
        
        
        
    }
}
