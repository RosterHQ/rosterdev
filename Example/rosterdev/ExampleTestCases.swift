//
//  ExampleTestCases.swift
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

// When adding a new test, add in a name here, and then use it in your code.

import Foundation
import rosterdev

class TestCases {
    private init() {
    }
    
    static let session = TestCases()
    
    static func setup() {
        _ = session
    }
    
    // Make these text names fairly short. They are presented in a UI.
    let test1 = InjectTest.define(testCaseName: "This is test1")
    let test2 = InjectTest.define(testCaseName: "This is test2")
    let test3 = InjectTest.define(testCaseName: "This is test3")
}
