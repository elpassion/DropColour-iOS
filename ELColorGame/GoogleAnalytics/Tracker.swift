//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class Tracker {

    let gaiTracker: GAITracker
    
    init(gaiTracker: GAITracker) {
        self.gaiTracker = gaiTracker
    }
    
    func trackScreenWithName(screenName name: String) {
        gaiTracker.set(kGAIScreenName, value: name)
        gaiTracker.send(GAIDictionaryBuilder.createScreenView().build() as [NSObject : AnyObject])
    }
    
    func trackGameStartEvent() {
        gaiTracker.send(GAIDictionaryBuilder.createEventWithCategory(
            "event",
            action: "dropcolour.event.game-start",
            label: nil,
            value: nil
        ).build() as [NSObject : AnyObject])
    }
    
    func trackGameEndEvent(score score: Int) {
        gaiTracker.send(GAIDictionaryBuilder.createEventWithCategory(
            "event",
            action: "dropcolour.event.game-end",
            label: nil,
            value: score
        ).build() as [NSObject : AnyObject])
    }

}
