//
//  ViewController.swift
//  rosterdev
//
//  Created by crspybits on 10/31/2017.
//  Copyright (c) 2017 crspybits. All rights reserved.
//

import UIKit
import rosterdev

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RosterDevInjectTest.if(TestCases.session.test1) {
            // Do whatever testing you need to do here. It will only run a) when the DEBUG build variable is set and b) the `test1` injection test is enabled.
        }
    }
}

