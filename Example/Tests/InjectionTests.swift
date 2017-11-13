//
//  InjectionTests.swift
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

import XCTest
@testable import rosterdev

class InjectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        RosterDevInjectTest.runTestsMultipleTimes = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoesNotRunByDefault() {
        var testRan = false
        
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(!testRan)
    }
    
    func testRunsIfTurnedOn() {
        RosterDevInjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(testRan)
    }
    
    func testRunsOnlyOnceByDefault() {
        RosterDevInjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(testRan)

        testRan = false
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(!testRan)
    }
    
    func testRunsMultipleTimesWhenAllowed() {
        RosterDevInjectTest.runTestsMultipleTimes = true
        RosterDevInjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(testRan)

        testRan = false
        RosterDevInjectTest.if("test1") {
            testRan = true
        }
        
        XCTAssert(testRan)
    }
}
