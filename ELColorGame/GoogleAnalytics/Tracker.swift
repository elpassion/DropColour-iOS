//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol TrackerProtocol {

    var gaiDictionaryFactory: GAIDictionaryCreating { get set }
    func trackScreenWithName(screenName name: String)
    func trackGameStartEvent()
    func trackGameEndEvent(score: Int)
    func trackGameScoredEvent(scoredValue value: Int)

}

class Tracker: TrackerProtocol {

    var gaiDictionaryFactory: GAIDictionaryCreating
    private let gaiTracker: GAITracker

    init(gaiTracker: GAITracker) {
        self.gaiTracker = gaiTracker
        self.gaiDictionaryFactory = GAIDictionaryFactory()
    }

    func trackScreenWithName(screenName name: String) {
        gaiTracker.set(kGAIScreenName, value: name)
        gaiTracker.send(GAIDictionaryBuilder.createScreenView().buildDict())
    }

    func trackGameStartEvent() {
        gaiTracker.send(gaiDictionaryFactory.createEventWithCategory("event", action: "dropcolour.event.game-start", value: nil))
    }

    func trackGameEndEvent(score: Int) {
        gaiTracker.send(gaiDictionaryFactory.createEventWithCategory("event", action: "dropcolour.event.game-end", value: score.number))
    }

    func trackGameScoredEvent(scoredValue value: Int) {
        gaiTracker.send(gaiDictionaryFactory.createEventWithCategory("event", action: "dropcolour.event.game-scored", value: value.number))
    }

}

private extension Int {

    var number: NSNumber {
        return NSNumber(value: self)
    }

}
