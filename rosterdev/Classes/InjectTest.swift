//
//  InjectTest.swift
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

import Foundation

public class InjectTest {
    static var runTestsMultipleTimes: Bool {
        set {
            InjectTestObjC.session().runTestsMultipleTimes = newValue
        }
        
        get {
            return InjectTestObjC.session().runTestsMultipleTimes
        }
    }
    
    static var sortedTestCaseNames: [String] {
        return InjectTestObjC.session().sortedTestCaseNames
    }
    
    private init() {
    }
    
    static func reset() {
        InjectTestObjC.session().reset()
    }
    
    // Returns `testCaseName` as a convenience.
    public static func define(testCaseName: String) -> String {
        InjectTestObjC.session().defineTest(testCaseName)
        return testCaseName
    }

    static func set(testCaseName: String, value: Bool) {
        InjectTestObjC.session().setTest(testCaseName, valueTo: value)
    }
    
    static func testIsOn(_ testCaseName: String) -> Bool {
        return InjectTestObjC.session().testIs(on: testCaseName)
    }

    public static func `if`(_ testCaseName:String, callback:@escaping ()->()) {
        InjectTestObjC.session().swiftRun(testCaseName) {
            callback()
        }
    }
}
