//
//  DebugDashboardData.swift
//  rosterdev_Example
//
//  Created by Christopher G Prince on 10/31/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import rosterdev

class DebugDashboardData {
    private init() {
    }
    
    static let session = DebugDashboardData()
    
    var debugDashboardExampleSection: [RosterDevRowContents] = {
        var useDev = RosterDevRowContents(name: "Use staging environment", action: { parentVC in
            // Need to do something to setup staging environment
        })
        var useProd = RosterDevRowContents(name: "Use prod environment", action: { parentVC in
            // Need to do something to setup prod environment
        })
        
        return [useDev, useProd]
    }()
    
    func sections() -> [[RosterDevRowContents]] {
        return [debugDashboardExampleSection]
    }
}
