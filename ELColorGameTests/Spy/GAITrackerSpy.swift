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
    private(set) var capturedData: [AnyHashable: Any]!

    // MARK: GAITracker

    var name = ""

    var allowIDFACollection = false

    func set(_ parameterName: String!, value: String!) {
        parameterNameWasSet = true
    }

    func get(_ parameterName: String!) -> String! {
        return ""
    }

    func send(_ parameters: [AnyHashable: Any]!) {
        dataWasSend = true
        capturedData = parameters
    }

}
