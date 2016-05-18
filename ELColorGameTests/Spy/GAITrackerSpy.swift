//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class GAITrackerSpy: NSObject, GAITracker {

    private(set) var dataWasSend = false
    private(set) var parameterNameWasSet = false
    private(set) var capturedData: [NSObject: AnyObject]!

    // MARK: GAITracker

    var name = ""

    var allowIDFACollection = false

    func set(parameterName: String!, value: String!) {
        parameterNameWasSet = true
    }

    func get(parameterName: String!) -> String! {
        return ""
    }

    func send(parameters: [NSObject: AnyObject]!) {
        dataWasSend = true
        capturedData = parameters
    }

}
