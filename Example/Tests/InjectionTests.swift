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
        InjectTest.runTestsMultipleTimes = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoesNotRunByDefault() {
        var testRan = false
        
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(!testRan)
    }
    
    func testRunsIfTurnedOn() {
        InjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(testRan)
    }
    
    func testRunsOnlyOnceByDefault() {
        InjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(testRan)

        testRan = false
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(!testRan)
    }
    
    func testRunsMultipleTimesWhenAllowed() {
        InjectTest.runTestsMultipleTimes = true
        InjectTest.set(testCaseName: "test1", value: true)
        var testRan = false
        
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(testRan)

        testRan = false
        InjectTest.if("test1") { 
            testRan = true
        }
        
        XCTAssert(testRan)
    }
}
