//
// Created by Mateusz Szklarek on 05/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class TrackerSpy: TrackerProtocol {

    private let gaiTracker: GAITracker
    private(set) var screenWasTracked = false
    private(set) var startEventWasTracked = false
    private(set) var endEventWasTracked = false
    private(set) var scoreEventWasTracked = false

    init(gaiTracker: GAITracker) {
        self.gaiTracker = gaiTracker
        self.gaiDictionaryFactory = GAIDictionaryFactoryFake()
    }

    // MARK: TrackerProtocol

    var gaiDictionaryFactory: GAIDictionaryCreating

    func trackScreenWithName(screenName name: String) {
        screenWasTracked = true
    }

    func trackGameStartEvent() {
        startEventWasTracked = true
    }

    func trackGameEndEvent(score: Int) {
        endEventWasTracked = true
    }

    func trackGameScoredEvent(scoredValue value: Int) {
        scoreEventWasTracked = true
    }

}
